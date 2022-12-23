# frozen_string_literal: true

# :nodoc:
module OpenStory
  module Plugins
    # Auto Reloading Support
    module Reloading
      class EnvPluginNotEnabled < RuntimeError; end
      class ZeitwerkPluginNotEnabled < RuntimeError; end

      def self.dependencies
        ['active_support/file_update_checker']
      end

      def self.extended(system)
        raise EnvPluginNotEnabled unless system.enabled_plugins.include?(:env)
        raise ZeitwerkPluginNotEnabled unless system.enabled_plugins.include?(:zeitwerk)

        system.config.autoloader.enable_reloading if system.env == :development
        system.after(:configure, &:setup_reloader)

        super
      end

      def setup_reloader
        paths = component_dirs.to_h { |dir| [root.join(dir.path).to_s, %w[rb]] }
        reloader = ActiveSupport::FileUpdateChecker.new([], paths) do
          autoloader.reload
        end

        register(:reloader, call: false) do
          next unless env == :development

          reloader.execute_if_updated
        end
      end
    end
  end

  Dry::System::Plugins.register(:reloading, Plugins::Reloading)
end
