# frozen_string_literal: true

require 'singleton'
require 'logger'

module OpenStory
  # The main application
  class Application < Dry::System::Container
    class << self
      def inherited(base)
        super
        OpenStory.app_class = base
      end
    end

    include Singleton

    class << self
      def configure(finalize_config: true, &block)
        super(finalize_config:) do |config|
          config.root = OpenStory.root
          config.component_dirs.add 'app/actions'

          instance_exec(config, &block) if block
        end
      end
    end

    use :env, inferrer: -> { ENV.fetch('OPENSTORY_ENV', :development).to_sym }
    use :monitoring
    use :bootsnap
    use :zeitwerk

    setting :observer, reader: true

    setting :logger, reader: true
    setting :log_levels, default: {
      development: ::Logger::DEBUG,
      test: ::Logger::DEBUG,
      production: ::Logger::ERROR
    }

    after(:configure) do
      unless registered?(:logger)
        config.logger = OpenStory::Logger.new(
          root.join('log').realpath.join("#{config.env}.log"),
          level: config.log_levels[config.env]
        )
        register(:logger, config.logger)
      end

      OpenStory.notifications.register_event('action.execute')
      OpenStory.notifications.subscribe('action.execute') do |event|
        OpenStory.logger.info "process #{event[:content]} in #{event[:time]}ms", source: event[:source],
                                                                                 uid: event[:uid]
      end

      self
    end

    def router
      @router ||= OpenStory::Router.new
    end
  end
end
