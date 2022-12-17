# frozen_string_literal: true

module OpenStory
  # The world event observer
  class Observer
    def start
      raise NotImplementedError
    end
  end
end
