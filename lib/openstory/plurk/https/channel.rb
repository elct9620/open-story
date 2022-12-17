# frozen_string_literal: true

module OpenStory
  module Plurk
    module HTTPS
      # The channel methods
      module Channel
        def create_channel
          res = get('Realtime/getUserChannel')
          OpenStory::Plurk::Channel.new(
            name: res['channel_name'],
            server: res['comet_server']
          )
        end
      end
    end
  end
end
