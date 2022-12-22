# frozen_string_literal: true

module OpenStory
  # The base action
  class Action
    def call(env)
      handle(env)
    end

    def handle(**env)
      raise NotImplementedError
    end
  end
end
