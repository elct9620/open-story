# frozen_string_literal: true

module OpenStory
  module Plurk
    # The observer to publish subscribed events
    class Observer
      include Dry::Configurable

      setting :app do
        setting :key
        setting :secret
      end

      setting :token
      setting :secret

      KEYWORD = '#OpenStory'
      DEFAULT_RESPONSE = '世界受到了一些干涉，然而連意識的概念都不存在，什麼變化都沒有⋯⋯'

      def initialize(&block)
        instance_exec(config, &block) if block
      end

      def token
        @token ||= Token.new(token: config.token, secret: config.secret)
      end

      def oauth
        @oauth ||= OAuth.new(key: config.app.key, secret: config.app.secret, token:)
      end

      def api
        @api ||= HTTP.new(oauth)
      end

      def me
        @me ||= api.me
      end

      def channel
        @channel ||= api.create_channel
      end

      def start
        Realtime.new(channel).each do |plurk|
          next if plurk.user_id == me.id

          OpenStory.logger.info plurk.content, uid: plurk.user_id

          case plurk
          in Plurk then on_plurk(plurk)
          in Response then on_response(plurk)
          end
        end
      end

      def on_plurk(plurk)
        return unless plurk.content.include?(KEYWORD)

        reply_to(plurk.id, DEFAULT_RESPONSE)
      end

      def on_response(response)
        return if response.plurk.nil?
        return unless response.plurk.content.include?(KEYWORD)

        reply_to(response.plurk_id, DEFAULT_RESPONSE)
      end

      def reply_to(id, content)
        api.add_response Response.new(
          plurk_id: id, content:
        )
      end
    end
  end
end
