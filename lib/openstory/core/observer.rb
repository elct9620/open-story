# frozen_string_literal: true

module OpenStory
  # The world event observer
  class Observer
    def logger
      OpenStory.logger
    end

    def start
      raise NotImplementedError
    end
  end
end
