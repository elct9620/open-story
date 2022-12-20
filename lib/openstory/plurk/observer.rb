# frozen_string_literal: true

module OpenStory
  module Plurk
    # The observer to publish subscribed events
    #
    # @note should move to app/bridges
    class Observer
      attr_reader :api, :keyword, :allowlist

      def initialize(api, keyword: '', allowlist: [])
        @api = api
        @keyword = keyword
        @allowlist = allowlist
      end

      def me
        @me ||= api.me
      end

      def channel
        @channel ||= api.create_channel
      end

      def realtime
        @realtime ||= Realtime.new(channel)
      end

      def next
        event = realtime.next
        case event
        when Plurk, Response
          dispatch(event) if allowed?(event.user_id) && desired?(event)
        else
          accept_friends(event)
        end
      end

      def desired?(event)
        content = case event
                  when Plurk then event.content
                  when Response then event.plurk.content
                  end
        content.include?(keyword)
      end

      def allowed?(id)
        return false if id == me.id
        return true if allowlist.empty?

        allowlist.include?(id)
      end

      def dispatch(event)
        reply_id = event.is_a?(Plurk) ? event.id : event.plurk_id
        [reply_id, event.content]
      end

      def reply_to(id, content)
        return if content.nil? || content == ''

        api.add_response Response.new(
          plurk_id: id, content:
        )
      rescue HTTP::RequestError => e
        OpenStory.logger.error e.message, action: 'plurk.response', id:
      end

      def accept_friends(data)
        count = data.dig('counts', 'req').to_i
        return unless count.positive?

        api.accept_all_friends
        nil
      rescue HTTP::RequestError => e
        OpenStory.logger.error e.message, action: 'plurk.accept_friends'
      end
    end
  end
end
