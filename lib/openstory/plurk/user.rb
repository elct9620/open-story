# frozen_string_literal: true

module OpenStory
  module Plurk
    # User Data
    class User < Dry::Struct
      transform_keys(&:to_sym)

      attribute :id, Types::Integer
      attribute :nick_name, Types::String
      attribute? :display_name, Types::String
    end
  end
end
