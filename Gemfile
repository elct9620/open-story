# frozen_string_literal: true

source 'https://rubygems.org'

# Core
gem 'activesupport'
gem 'dry-cli'
gem 'dry-configurable'
gem 'dry-container'
gem 'dry-events'
gem 'dry-logger'
gem 'dry-monitor'
gem 'dry-struct'
gem 'dry-system'

# Utils
gem 'bootsnap'
gem 'concurrent-ruby', '~> 1.0'
gem 'dotenv'
gem 'oj'
gem 'rake'
gem 'sorbet-runtime'

# Monitoring
gem 'sentry-ruby'

group :development, :test do
  gem 'bundler-audit', require: false
end

group :development do
  gem 'overcommit', require: false

  gem 'sorbet'
  gem 'spoom', require: false
  gem 'tapioca', require: false

  gem 'pry'

  gem 'boxing'
end

group :test do
  gem 'cucumber'

  gem 'rspec'
  gem 'rspec_junit_formatter', require: false

  gem 'simplecov', require: false
  gem 'simplecov-cobertura', require: false

  gem 'webmock'

  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-sorbet', require: false
end
