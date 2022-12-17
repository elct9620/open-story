# frozen_string_literal: true

module OpenStory
  # The main application
  class Application < Dry::System::Container
    def self.root
      Bundler.root
    end

    use :env, inferrer: -> { ENV.fetch('OPENSTORY_ENV', :development).to_sym }
    use :logging
    use :monitoring
    use :bootsnap
    use :zeitwerk, eager_load: true
    configure do |config|
      config.root = Application.root
      config.component_dirs.add 'app'
    end
  end
end
