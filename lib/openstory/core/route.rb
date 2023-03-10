# frozen_string_literal: true

require 'concurrent/set'

module OpenStory
  # the action route
  class Route
    attr_reader :regexp

    def initialize(pattern, to:, container:)
      @container = container
      @pattern = pattern
      @regexp = Regexp.new(pattern)
      @to = to
    end

    def eql?(other)
      hash == other.hash
    end

    def hash
      regexp.hash
    end

    def action_name
      @action_name ||= "#{@to}_action".tr('/', '.')
    end

    def resolve
      @container.resolve(action_name)
    end
  end
end
