# frozen_string_literal: true

module OpenStory
  module Plurk
    module HTTPS
      # The Alert API
      module Alert
        def accept_all_friends
          get('Alerts/addAllAsFriends')
        end
      end
    end
  end
end
