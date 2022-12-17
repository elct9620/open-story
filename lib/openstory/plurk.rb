# frozen_string_literal: true

require 'bundler/setup'

module OpenStory
  # The Plurk Client
  module Plurk
    ENDPOINT = 'https://www.plurk.com/APP/%<path>s'

    require_relative 'plurk/token'
    require_relative 'plurk/oauth'
    require_relative 'plurk/channel'
    require_relative 'plurk/http'
    require_relative 'plurk/realtime'
  end
end
