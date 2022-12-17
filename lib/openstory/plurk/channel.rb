# frozen_string_literal: true

module OpenStory
  module Plurk
    # Realtime Channel
    class Channel < Dry::Struct
      OFFSET_REGEX = /offset=-?\d+/
      attribute :name, Dry::Types['string']
      attribute :server, Dry::Types['string']

      def uri(offset: 0)
        URI(server.gsub(OFFSET_REGEX, "offset=#{offset}"))
      end
    end
  end
end
