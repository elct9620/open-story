# frozen_string_literal: true

module OpenStory
  module Plurk
    module HTTPS
      # HTTP Response handler
      module Response
        def add_response(response)
          get('Responses/responseAdd',
              plurk_id: response.plurk_id,
              content: response.content,
              qualifier: 'says')
        end
      end
    end
  end
end
