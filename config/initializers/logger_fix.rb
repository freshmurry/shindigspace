# Fix for Logger compatibility issue with Ruby 3.2.4 and Rails 6.1
# This ensures the Logger class is available when Rails needs it

require 'logger'

# Ensure Logger is available in the global namespace
unless defined?(Logger)
  Logger = ::Logger
end

# Ensure Logger::Severity is available
unless defined?(Logger::Severity)
  Logger::Severity = ::Logger::Severity
end 