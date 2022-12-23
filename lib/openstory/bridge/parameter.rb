# frozen_string_literal: true

module OpenStory
  module Bridge
    # The parameter inputs
    class Parameter
      def initialize(env)
        @env = env
        @params = env[:params]&.transform_keys(&:to_sym) || {}
      end

      def [](key)
        @params[key.to_sym]
      end
    end
  end
end
