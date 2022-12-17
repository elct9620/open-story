# frozen_string_literal: true

require 'singleton'

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

    use :env, inferrer: -> { ENV.fetch('OPENSTORY_ENV', :development).to_sym }
    use :logging
    use :monitoring
    use :bootsnap
    use :zeitwerk, eager_load: true

    configure do |config|
      config.root = OpenStory.root
      config.component_dirs.add 'app'
    end
  end
end
