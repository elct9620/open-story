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

      setting :keyword, default: '#OpenStory'
      setting :allowlist, default: '', constructor: proc { |value| value.to_s.split(',').map(&:to_i) }

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
          case plurk
          when Plurk, Response
            dispatch(plurk) if allowed?(plurk.user_id) && desired?(plurk)
          else
            update_friends(plurk)
            OpenStory.logger.debug plurk
          end
        end
      end

      def desired?(data)
        (data&.plurk&.content || data.content).include?(config.keyword)
      end

      def allowed?(id)
        return false if id == me.id
        return true if config.allowlist.empty?

        config.allowlist.include?(id)
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

      def update_friends(data)
        count = data.dig('counts', 'req').to_i
        return unless count.positive?

        api.accept_all_friends
      rescue RuntimeError => e
        OpenStory.logger.warn e.message, action: 'plurk.accept_friends'
      end
    end
  end
end
