# frozen_string_literal: true

module OpenStory
  # The base action
  class Action
    attr_reader :params

    def call(env)
      @params = OpenStory::Bridge::Parameter.new(env)
      handle(env)
    end

    def handle(*); end
  end
end
