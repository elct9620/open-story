# frozen_string_literal: true

source 'https://rubygems.org'

# Core
gem 'dry-cli'
gem 'dry-configurable'
gem 'dry-events'
gem 'dry-monitor'
gem 'dry-struct'
gem 'dry-system'

# Utils
gem 'bootsnap'
gem 'dotenv'
gem 'oj'
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

  gem 'rubocop'
  gem 'rubocop-performance', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-sorbet', require: false
end
