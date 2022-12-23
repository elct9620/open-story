# frozen_string_literal: true

module OpenStory
  module Bridge
    # The base action
    class Action
      attr_reader :params

      def call(env)
        @params = Parameter.new(env)
        handle(env)
      end

      def handle(*); end
    end
  end
end
