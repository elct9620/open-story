# frozen_string_literal: true

require 'forwardable'
require 'dry/logger'

# The open story service
module OpenStory
  # the open story core
  module Core
  end

  class << self
    extend Forwardable

    attr_accessor :app_class

    delegate %i[env observer logger autoloader finalize!] => :app_class

    %i[production development test].each do |method|
      define_method("#{method}?") { env == method }
    end

    def application
      @application ||= app_class&.instance
    end

    def initialize!
      finalize!
    end

    def root
      Bundler.root
    end
  end
end
