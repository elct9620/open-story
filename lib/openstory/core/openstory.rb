# frozen_string_literal: true

require 'forwardable'

# The open story service
module OpenStory
  # the open story core
  module Core
  end

  class << self
    extend Forwardable

    attr_accessor :app_class

    delegate %i[env autoloader finalize!] => :app_class

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
