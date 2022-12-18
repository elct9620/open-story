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

          case plurk
          when Plurk, Response
            dispatch(plurk) if desired?(plurk)
          else
            OpenStory.logger.debug plurk
          end
        end
      end

      def desired?(data)
        (data&.plurk&.content || data.content).include?(KEYWORD)
      end

      def dispatch(data)
        route = OpenStory.application.router.match(data.content)
        return unless route

        OpenStory.notifications.instrument('action.execute', action: route.action_name, content: data.content,
                                                             source: :plurk, uid: data.user_id) do
          action = route.action.new

          reply_id = data.is_a?(Plurk) ? data.id : data.plurk_id
          reply_to(reply_id, action.call)
        end
      end

      def reply_to(id, content)
        api.add_response Response.new(
          plurk_id: id, content:
        )
      rescue RuntimeError => e
        OpenStory.logger.warn e.message, action: 'plurk.response', id:
      end
    end
  end
end
