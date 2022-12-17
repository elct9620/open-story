# frozen_string_literal: true

module OpenStory
  module Plurk
    # Plurk
    class Plurk < Dry::Struct
      transform_keys(&:to_sym)

      attribute? :id, Types::Integer
      attribute :user_id, Types::Integer
      attribute :content, Types::String
      attribute :content_raw, Types::String
    end
  end
end
