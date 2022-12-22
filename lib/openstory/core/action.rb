# frozen_string_literal: true

module OpenStory
  # The base action
  class Action
    attr_reader :params

    def call(env)
      @params = env[:params]
      handle(env)
    end

    def handle(*); end
  end
end
