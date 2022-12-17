# frozen_string_literal: true

module OpenStory
  module Plurk
    # Realtime Channel
    class Channel < Dry::Struct
      attribute :name, Dry::Types['string']
      attribute :server, Dry::Types['string']

      def uri
        URI(server)
      end
    end
  end
end
