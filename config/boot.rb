ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

# Fix for Logger compatibility issue with Ruby 3.2.4 and Rails 6.1
require 'logger'

# Ensure Logger is available in the global namespace
unless defined?(Logger)
  Logger = ::Logger
end

# Ensure Logger::Severity is available
unless defined?(Logger::Severity)
  Logger::Severity = ::Logger::Severity
end
