# frozen_string_literal: true

require 'net/http'
require 'cgi'
require 'base64'

require 'openstory/support/pipeline'

module OpenStory
  module Plurk
    # The API request signer
    class OAuth
      using OpenStory::Support::Pipeline

      BuildBase = operation do |method, url, params|
        [method, CGI.escape(url), CGI.escape(URI.encode_www_form(params))].join('&')
      end

      HMACDigest = operation do |secret, token, base|
        OpenSSL::HMAC.digest('SHA1', "#{secret}&#{token.secret}", base)
      end

      EncodeWithBase64 = operation { |data| Base64.encode64(data).chomp }

      SUPPORTED_METHODS = {
        get: Net::HTTP::Get
      }.freeze

      def initialize(key:, secret:, token:)
        @key = key
        @secret = secret
        @token = token
      end

      def build(method, uri, params: {})
        params = self.params.merge(params)
        signature = sign('GET', uri.to_s, params)
        SUPPORTED_METHODS[method]
          .new(URI("#{uri}?#{URI.encode_www_form(params.merge(oauth_signature: signature))}"))
      end

      def sign(method, url, params)
        params.sort.to_h >>
          BuildBase[method, url] >>
          HMACDigest[@secret, @token] >>
          EncodeWithBase64
      end

      def params
        {
          oauth_consumer_key: @key,
          oauth_nonce: Random.rand(100_000).to_s,
          oauth_signature_method: 'HMAC-SHA1',
          oauth_timestamp: Time.now.to_i,
          oauth_token: @token.token,
          oauth_version: '1.0'
        }
      end
    end
  end
end
