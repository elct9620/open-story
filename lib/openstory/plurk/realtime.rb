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

        plurks&.each(&block) until @stopped
      end

      def stopped?
        @stopped == true
      end

      def stop
        @stopped = true
      end

      def plurks
        poll
          &.filter_map do |plurk|
            case plurk['type']
            in 'new_plurk' then Plurk.new(plurk)
            in 'new_response' then Response.new(plurk['response'].merge(plurk: plurk['plurk']))
            else plurk
            end
          end
      end

      def poll
        body = Net::HTTP.get(@channel.uri(offset: @offset))
        res = JSON.parse(body[COMET_SCRIPT_REGEX, 1])
        @offset = res['new_offset']
        res['data']
      end
    end
  end
end
