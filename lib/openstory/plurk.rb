# frozen_string_literal: true

require 'dry/system'
require 'openstory/core'

module OpenStory
  # The Plurk Client
  module Plurk
    ENDPOINT = 'https://www.plurk.com/APP/%<path>s'

    require_relative 'plurk/token'
    require_relative 'plurk/oauth'
    require_relative 'plurk/channel'
    require_relative 'plurk/user'
    require_relative 'plurk/plurk'
    require_relative 'plurk/response'
    require_relative 'plurk/http'
    require_relative 'plurk/realtime'
    require_relative 'plurk/observer'
    require_relative 'plurk/provider'
  end
end
