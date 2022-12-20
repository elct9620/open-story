# frozen_string_literal: true

module OpenStory
  module Plurk
    # Realtime Channel
    class Channel < Dry::Struct
      OFFSET_REGEX = /offset=-?\d+/
      attribute :name, Dry::Types['string']
      attribute :server, Dry::Types['string']

      def uri(offset: nil)
        server_with_offset = if offset
                               server.gsub(OFFSET_REGEX, "offset=#{offset}")
                             else
                               server
                             end
        URI(server_with_offset)
      end
    end
  end
end
