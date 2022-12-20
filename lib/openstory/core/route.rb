# frozen_string_literal: true

require 'concurrent/set'

module OpenStory
  # the action route
  class Route
    attr_reader :regexp

    def initialize(pattern, to:)
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

    def match?(action)
      regexp.match?(action)
    end

    def action_name
      @action_name ||= "#{@to}_action".tr('/', '.')
    end

    def resolve
      OpenStory.app_class.resolve(action_name)
    end
  end
end
