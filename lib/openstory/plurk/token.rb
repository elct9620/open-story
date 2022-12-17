# frozen_string_literal: true

require 'dry/struct'

module OpenStory
  module Plurk
    class Token < Dry::Struct
      attribute :token, Dry::Types['string']
      attribute :secret, Dry::Types['string']
    end
  end
end
