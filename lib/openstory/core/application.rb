# frozen_string_literal: true

require 'singleton'

module OpenStory
  # The main application
  class Application < Dry::System::Container
    class << self
      def inherited(base)
        super
        OpenStory.app_class = base
        base.configure unless base.configured?
      end
    end

    include Singleton

    use :env, inferrer: -> { ENV.fetch('OPENSTORY_ENV', :development).to_sym }
    use :logging
    use :monitoring
    use :bootsnap
    use :zeitwerk

    class << self
      def configure(finalize_config: true, &block)
        super(finalize_config:) do |config|
          config.root = OpenStory.root
          config.component_dirs.add 'app/observers'

          instance_exec(config, &block) if block
        end
      end
    end
  end
end
