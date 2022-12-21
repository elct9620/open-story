# frozen_string_literal: true

module OpenStory
  module Bridge
    # Worker handle the observer to exhcnage message
    class Worker
      def initialize(router, observer, notifications)
        @router = router
        @observer = observer
        @notifications = notifications
      end

      def next
        id, content = @observer.next
        return unless id && content

        dispatch id, content
      end

      def dispatch(id, content)
        route = @router.match(content)
        return unless route

        @notifications.instrument('action.execute', action: route.action_name, content:) do
          @observer.reply_to id, route.resolve.call
        end
      end
    end
  end
end
