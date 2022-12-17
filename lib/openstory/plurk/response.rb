# frozen_string_literal: true

module OpenStory
  module Plurk
    # Realtime Channel
    class Response < Dry::Struct
      attribute? :id, Types::Integer
      attribute :plurk_id, Types::Integer
      attribute :content, Types::String
    end
  end
end
