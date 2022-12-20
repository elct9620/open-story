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
        @offset = nil
        @stopped = false
      end

      def each(&)
        event_stream.each(&)
      end

      def next
        each.next
      end

      def stopped?
        @stopped == true
      end

      def stop
        @stopped = true
      end

      def event_stream
        @event_stream ||= Enumerator.new do |y|
          loop do
            break if stopped?

            stream
              &.filter_map { |data| convert(data) }
              &.each { |event| y.yield event }
          end
        end.lazy
      end

      def convert(event)
        case event['type']
        in 'new_plurk' then Plurk.new(event)
        in 'new_response' then Response.new(event['response'].merge(plurk: event['plurk']).compact)
        else event
        end
      end

      def stream
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
