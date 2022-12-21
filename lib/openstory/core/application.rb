# frozen_string_literal: true

require 'singleton'
require 'logger'

require 'openstory/bridge'

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
        OpenStory.logger.info "process #{event[:content]} in #{event[:time]}ms", action: event[:action]
      end

      self
    end

    def router
      @router ||= OpenStory::Router.new(OpenStory.app_class)
    end

    def bridge
      @bridge ||= OpenStory::Bridge::Server.new(
        router,
        OpenStory.logger,
        OpenStory.notifications
      )
    end
  end
end
