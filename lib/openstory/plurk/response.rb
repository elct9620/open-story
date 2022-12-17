# frozen_string_literal: true

module OpenStory
  module Plurk
    # Response
    class Response < Dry::Struct
      transform_keys(&:to_sym)

      attribute? :id, Types::Integer
      attribute :plurk_id, Types::Integer
      attribute :content, Types::String
    end
  end
end
