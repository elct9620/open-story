# frozen_string_literal: true

require 'dry-types'

module OpenStory
  # The types
  module Types
    T.unsafe(self).include Dry.Types()
  end
end
