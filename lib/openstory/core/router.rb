# frozen_string_literal: true

require 'concurrent/set'

module OpenStory
  # The action router
  class Router
    attr_reader :container

    def initialize(container)
      @container = container
      @routes = ::Concurrent::Set.new
      @default = nil
    end

    def draw(&)
      instance_exec(self, &)
    end

    def default(to:)
      @default = Route.new(/.*/, to:, container:)
    end

    def action(pattern, to:)
      route = Route.new(pattern, to:, container:)
      @routes.add(route)
    end

    def size
      @routes.size
    end

    def include?(pattern)
      @routes.find { |route| route.eql?(pattern) } != nil
    end

    def match(action)
      @routes.find { |route| route.match?(action) } || @default
    end
  end
end
