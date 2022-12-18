# frozen_string_literal: true

require 'json'

require_relative 'https/channel'
require_relative 'https/user'
require_relative 'https/alert'
require_relative 'https/response'

module OpenStory
  module Plurk
    # HTTP client
    class HTTP
      class RequestError < StandardError; end

      include HTTPS::Channel
      include HTTPS::User
      include HTTPS::Response
      include HTTPS::Alert

      def initialize(oauth)
        @oauth = oauth
      end

      def get(path, **params)
        uri = URI(format(ENDPOINT, path:))
        execute @oauth.build(:get, uri, params:)
      end

      def execute(request)
        res = Net::HTTP.start(request.uri.host, request.uri.port, use_ssl: true) do |http|
          http.request request
        end
        data = JSON.parse(res.body)
        return data if res.is_a?(Net::HTTPSuccess)

        raise RequestError, data['error_text']
      end
    end
  end
end
