# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `boxing` gem.
# Please instead update this file by running `bin/tapioca gem boxing`.

# The tool to generate Dockerfile without config
#
# @since 0.1.0
module Boxing
  private

  # @return [Boxing::Config]
  # @since 0.5.0
  #
  # source://boxing//lib/boxing.rb#31
  def config(&block); end

  # @return [Bundler::Dependency]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing.rb#21
  def dependencies(groups = T.unsafe(nil)); end

  class << self
    # @return [Boxing::Config]
    # @since 0.5.0
    #
    # source://boxing//lib/boxing.rb#31
    def config(&block); end

    # @return [Bundler::Dependency]
    # @since 0.1.0
    #
    # source://boxing//lib/boxing.rb#21
    def dependencies(groups = T.unsafe(nil)); end
  end
end

# The Main Command
#
# @since 0.1.0
class Boxing::Command < ::Thor
  # source://thor/1.2.1/lib/thor.rb#40
  def compose(*args); end

  # source://thor/1.2.1/lib/thor.rb#40
  def generate(*args); end

  # source://thor/1.2.1/lib/thor.rb#40
  def update(*args); end

  class << self
    # @return [Boolean]
    # @since 0.1.0
    #
    # source://boxing//lib/boxing/command.rb#11
    def exit_on_failure?; end
  end
end

module Boxing::Commands; end

# The Base Command
#
# @since 0.5.0
class Boxing::Commands::Base < ::Thor::Group
  include ::Thor::Actions
  extend ::Thor::Actions::ClassMethods

  # Prepare command environment
  #
  # @since 0.5.0
  #
  # source://boxing//lib/boxing/commands/base.rb#20
  def prepare; end

  private

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/commands/base.rb#30
  def context; end

  class << self
    # @since 0.5.0
    #
    # source://boxing//lib/boxing/commands/base.rb#13
    def source_root; end
  end
end

# The Docker Compose Generator
#
# @since 0.1.0
class Boxing::Commands::Compose < ::Boxing::Commands::Base
  # Create Dockerfile
  #
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/commands/compose.rb#13
  def execute; end
end

# The Dockerfle Generator
#
# @since 0.1.0
class Boxing::Commands::Generate < ::Boxing::Commands::Base
  # Create Dockerfile
  #
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/commands/generate.rb#16
  def execute; end
end

# The Database Updater
#
# @since 0.3.0
class Boxing::Commands::Update < ::Boxing::Commands::Base
  # Update Database
  #
  # @since 0.3.0
  #
  # source://boxing//lib/boxing/commands/update.rb#13
  def execute; end
end

# The config of boxing
#
# @since 0.5.0
class Boxing::Config
  # @return [Config] a new instance of Config
  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#19
  def initialize(&block); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def assets_precompile; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def assets_precompile=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def build_packages; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def build_packages=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def health_check; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def health_check=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def health_check_path; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def health_check_path=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def ignores; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def ignores=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def name; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def name=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def node_version; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def node_version=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def port; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def port=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def registry; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def registry=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def revision; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def revision=(_arg0); end

  # @return [String] the application root
  #
  # source://boxing//lib/boxing/config.rb#12
  def root; end

  # @return [String] the application root
  #
  # source://boxing//lib/boxing/config.rb#12
  def root=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def runtime_packages; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def runtime_packages=(_arg0); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def sentry_release; end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/config.rb#12
  def sentry_release=(_arg0); end
end

# The template context
#
# @since 0.1.0
class Boxing::Context
  # @param config [Boxing::Config]
  # @param database [Boxing::Database]
  # @param dependencies [Array<Bundler::Dependency>]
  # @return [Context] a new instance of Context
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/context.rb#16
  def initialize(config, database, dependencies = T.unsafe(nil)); end

  # @since 0.5.0
  #
  # source://boxing//lib/boxing/context.rb#9
  def config; end

  # Default packages
  #
  # @return [Array<Boxing::Package>]
  # @since 0.4.0
  #
  # source://boxing//lib/boxing/context.rb#65
  def default_packages; end

  # Extra Packages
  #
  # @return [Array<Boxing::Package>]
  # @since 0.6.0
  #
  # source://boxing//lib/boxing/context.rb#79
  def extra_packages; end

  # Does any gem from git
  #
  # @return [TrueClass|FalseClass]
  # @since 0.4.0
  #
  # source://boxing//lib/boxing/context.rb#56
  def git?; end

  # Check rubygems exists
  #
  # @param names [Array<String>]
  # @return [TrueClass|FalseClass]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/context.rb#47
  def has?(*names); end

  # Check Package Mode
  #
  # @return [Number]
  # @since 0.6.3
  #
  # source://boxing//lib/boxing/context.rb#112
  def mode_of(name); end

  # Return node.js version
  #
  # @return [String]
  # @since 0.6.0
  #
  # source://boxing//lib/boxing/context.rb#92
  def node_version; end

  # Return required packages
  #
  # @return [Set<Boxing::Package>] packages
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/context.rb#29
  def packages; end

  # Convert to binding
  #
  # @return [Binding]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/context.rb#103
  def to_binding; end
end

# The package and dependency mapping database
#
# @since 0.1.0
class Boxing::Database
  # Initialize Database
  #
  # @return [Database] a new instance of Database
  # @since 0.3.0
  #
  # source://boxing//lib/boxing/database.rb#61
  def initialize(path = T.unsafe(nil)); end

  # Enumerates over gems
  #
  # @param name [String] the gem name
  # @since 0.1.0
  # @yield [path] The given block will be passed each package path
  # @yieldparam A [String] path to package `.yml` file
  #
  # source://boxing//lib/boxing/database.rb#111
  def each_package_path_for(name, &block); end

  # The Database is Git Repoistory
  #
  # @return [TrueClass|FalseClass]
  # @since 0.3.0
  #
  # source://boxing//lib/boxing/database.rb#70
  def git?; end

  # Find packages for rubygems
  #
  # @param name [String] the gem name
  # @since 0.1.0
  # @yield [path] The given block will be passed each package path
  # @yieldparam The [Boxing::Package] package related rubygem
  #
  # source://boxing//lib/boxing/database.rb#96
  def package_for(name); end

  # @since 0.3.0
  #
  # source://boxing//lib/boxing/database.rb#56
  def path; end

  # Update the database
  #
  # @since 0.3.0
  #
  # source://boxing//lib/boxing/database.rb#77
  def update!; end

  class << self
    # Download Database
    #
    # @raise [DownloadFailed]
    # @since 0.3.0
    #
    # source://boxing//lib/boxing/database.rb#26
    def download!(path = T.unsafe(nil)); end

    # Check for the database exists
    #
    # @param path [String]
    # @return [TrueClass\FalseClass]
    # @since 0.3.0
    #
    # source://boxing//lib/boxing/database.rb#19
    def exist?(path = T.unsafe(nil)); end
  end
end

# @since 0.3.0
#
# source://boxing//lib/boxing/database.rb#53
Boxing::Database::DEFAULT_PATH = T.let(T.unsafe(nil), Pathname)

# @since 0.3.0
class Boxing::Database::DownloadFailed < ::RuntimeError; end

# Git URL of the ruby-boxing-db
#
# @since 0.3.0
#
# source://boxing//lib/boxing/database.rb#45
Boxing::Database::URL = T.let(T.unsafe(nil), String)

# Path to the user's copy of ruby-boxing-db
#
# @since 0.3.0
#
# source://boxing//lib/boxing/database.rb#50
Boxing::Database::USER_PATH = T.let(T.unsafe(nil), Pathname)

# @since 0.3.0
class Boxing::Database::UpdateFailed < ::RuntimeError; end

# @since 0.1.0
#
# source://boxing//lib/boxing.rb#14
Boxing::LOCK = T.let(T.unsafe(nil), Thread::Mutex)

# The rubygems mapping for Linux package
#
# @since 0.1.0
class Boxing::Package
  # @param name [String] the package name
  # @param version [String] the package version
  # @param mode [Number] is runtime or build
  # @return [Package] a new instance of Package
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#39
  def initialize(name, version = T.unsafe(nil), mode: T.unsafe(nil)); end

  # Compare is same package
  #
  # @return [TrueClass|FalseClass]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#64
  def ==(other); end

  # @return [TrueClass|FalseClass] is for build
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#48
  def build?; end

  # Compare is same package
  #
  # @return [TrueClass|FalseClass]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#64
  def eql?(other); end

  # Return Object#hash
  #
  # @return [Number]
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#74
  def hash; end

  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#32
  def name; end

  # @return [TrueClass|FalseClass] is for runtime
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#55
  def runtime?; end

  # Convert to string
  #
  # @return [String] the package string
  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#83
  def to_s; end

  # @since 0.1.0
  #
  # source://boxing//lib/boxing/package.rb#32
  def version; end

  class << self
    # Load Required Packages
    #
    # @return [Boxing::Package]
    # @since 0.1.0
    #
    # source://boxing//lib/boxing/package.rb#16
    def load(path); end
  end
end

# @since 0.1.0
#
# source://boxing//lib/boxing/package.rb#29
Boxing::Package::BUILD = T.let(T.unsafe(nil), Integer)

# @since 0.1.0
#
# source://boxing//lib/boxing/package.rb#26
Boxing::Package::RUNTIME = T.let(T.unsafe(nil), Integer)

# source://boxing//lib/boxing/version.rb#4
Boxing::VERSION = T.let(T.unsafe(nil), String)

class Thor::Group
  include ::Thor::Base
  include ::Thor::Invocation
  include ::Thor::Shell
  extend ::Thor::Base::ClassMethods
  extend ::Thor::Invocation::ClassMethods

  protected

  # source://thor/1.2.1/lib/thor/group.rb#265
  def _invoke_for_class_method(klass, command = T.unsafe(nil), *args, &block); end

  class << self
    # source://thor/1.2.1/lib/thor/group.rb#161
    def class_options_help(shell, groups = T.unsafe(nil)); end

    # source://thor/1.2.1/lib/thor/group.rb#16
    def desc(description = T.unsafe(nil)); end

    # source://thor/1.2.1/lib/thor/group.rb#172
    def get_options_from_invocations(group_options, base_options); end

    # source://thor/1.2.1/lib/thor/group.rb#207
    def handle_argument_error(command, error, _args, arity); end

    # source://thor/1.2.1/lib/thor/group.rb#29
    def help(shell); end

    # source://thor/1.2.1/lib/thor/group.rb#45
    def invocation_blocks; end

    # source://thor/1.2.1/lib/thor/group.rb#39
    def invocations; end

    # source://thor/1.2.1/lib/thor/group.rb#56
    def invoke(*names, &block); end

    # source://thor/1.2.1/lib/thor/group.rb#110
    def invoke_from_option(*names, &block); end

    # source://thor/1.2.1/lib/thor/group.rb#199
    def printable_commands(*_arg0); end

    # source://thor/1.2.1/lib/thor/group.rb#199
    def printable_tasks(*_arg0); end

    # source://thor/1.2.1/lib/thor/group.rb#149
    def remove_invocation(*names); end

    protected

    # source://thor/1.2.1/lib/thor/group.rb#238
    def banner; end

    # source://thor/1.2.1/lib/thor/group.rb#248
    def baseclass; end

    # source://thor/1.2.1/lib/thor/group.rb#252
    def create_command(meth); end

    # source://thor/1.2.1/lib/thor/group.rb#252
    def create_task(meth); end

    # source://thor/1.2.1/lib/thor/group.rb#217
    def dispatch(command, given_args, given_opts, config); end

    # source://thor/1.2.1/lib/thor/group.rb#243
    def self_command; end

    # source://thor/1.2.1/lib/thor/group.rb#243
    def self_task; end
  end
end
