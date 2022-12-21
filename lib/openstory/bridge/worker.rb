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
        env = @observer.next
        return unless env

        dispatch env
      end

      def dispatch(env)
        route = @router.match(env[:content])
        return unless route

        @notifications.instrument('action.execute', action: route.action_name, **env) do
          @observer.reply_to env[:id], route.resolve.call
        end
      end
    end
  end
end
