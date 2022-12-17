# frozen_string_literal: true

module OpenStory
  module Plurk
    module HTTPS
      # Plurk User API
      module User
        def me
          res = get('Users/me')
          OpenStory::Plurk::User.new(res)
        end
      end
    end
  end
end
