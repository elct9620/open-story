# frozen_string_literal: true

module OpenStory
  # The base action
  class Action
    def call(*)
      raise NotImplementedError
    end
  end
end
