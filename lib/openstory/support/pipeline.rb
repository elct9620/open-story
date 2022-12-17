# frozen_string_literal: true

module OpenStory
  module Support
    # Elixir-style pipeline
    module Pipeline
      refine Kernel do
        def operation(...) = proc(...).curry
      end

      refine Object do
        def >>(other) = other.call(self)
      end
    end
  end
end
