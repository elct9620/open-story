# frozen_string_literal: true

require 'json'

require_relative 'https/channel'

module OpenStory
  module Plurk
    # HTTP client
    class HTTP
      include HTTPS::Channel

      def initialize(oauth)
        @oauth = oauth
      end

      def get(path, params: {})
        uri = URI(format(ENDPOINT, path:))
        execute @oauth.build(:get, uri, params:)
      end

      def execute(request)
        res = Net::HTTP.start(request.uri.host, request.uri.port, use_ssl: true) do |http|
          http.request request
        end
        return JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)

        raise res.body
      end
    end
  end
end
