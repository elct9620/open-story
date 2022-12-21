# frozen_string_literal: true

module OpenStory
  module Bridge
    # Worker handle the observer to exhcnage message
    class Worker
      def initialize(router, observer)
        @router = router
        @observer = observer
      end

      def next
        id, content = @observer.next
        return unless id && content

        dispatch id, content
      end

      def dispatch(id, content)
        route = @router.match(content)
        return unless route

        OpenStory.notifications.instrument('action.execute', action: route.action_name, content:) do
          @observer.reply_to id, route.resolve.call
        end
      end
    end
  end
end
