# frozen_string_literal: true

require 'concurrent/set'

module OpenStory
  # the action route
  class Route
    def initialize(pattern, to:)
      @pattern = pattern
      @to = to
    end

    def hash
      regexp.hash
    end

    def match?(action)
      regexp.match?(action)
    end

    def action_name
      @action_name ||= OpenStory.autoloader.inflector.camelize("#{@to}_action", nil)
    end

    def action
      Object.const_get(action_name)
    end

    def regexp
      @regexp ||= Regexp.new(@pattern)
    end
  end
end
