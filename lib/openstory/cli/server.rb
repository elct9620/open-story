# frozen_string_literal: true

module OpenStory
  module CLI
    # Run open story server
    class Server < Dry::CLI::Command
      desc 'start the server'

      argument :observer, default: 'plurk', desc: 'The observer to serve'

      def call(observer:)
        class_name = OpenStory.autoloader.inflector.camelize("#{observer}_observer", nil)
        observer = Kernel.const_get(class_name).new
        observer.start
      end
    end
  end
end
