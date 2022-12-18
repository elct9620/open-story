# frozen_string_literal: true

module OpenStory
  module Plurk
    # The Realtime API client
    class Realtime
      include Enumerable

      COMET_SCRIPT_REGEX = /CometChannel\.scriptCallback\((.*)\)/

      attr_reader :offset

      def initialize(channel)
        @channel = channel
        @offset = 0
        @stopped = false
      end

      def each(&block)
        return enum_for(:each) unless block

        event_stream&.each(&block) until stopped?
      end

      def stopped?
        @stopped == true
      end

      def stop
        @stopped = true
      end

      def event_stream
        poll
          &.filter_map do |event|
            case event['type']
            in 'new_plurk' then Plurk.new(event)
            in 'new_response' then Response.new(event['response'].merge(plurk: event['plurk']).compact)
            else event
            end
          end
      end

      def poll
        body = Net::HTTP.get(@channel.uri(offset: @offset))
        res = JSON.parse(body[COMET_SCRIPT_REGEX, 1].to_s)
        @offset = res['new_offset']
        res['data']
      rescue JSON::ParserError
        []
      end
    end
  end
end
