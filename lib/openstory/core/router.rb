# frozen_string_literal: true

require 'concurrent/set'

module OpenStory
  # The action router
  class Router
    def initialize
      @routes = ::Concurrent::Set.new
      @default = nil
    end

    def draw(&)
      instance_exec(self, &)
    end

    def default(to:)
      @default = Route.new(/.*/, to:)
    end

    def action(pattern, to:)
      route = Route.new(pattern, to:)
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
