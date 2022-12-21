# frozen_string_literal: true

module OpenStory
  module Bridge
    # The mock observer can be used for test
    class MockObserver
      def next = [1, 'PING']
      def reply_to(_id, _content) = true
    end
  end
end
