# Fix for URI.escape deprecation in Ruby 3.2
# Paperclip still uses the deprecated URI.escape method
# This adds it back for compatibility

require 'uri'
require 'cgi'

# Add back URI.escape for compatibility with Paperclip
unless URI.respond_to?(:escape)
  def URI.escape(s)
    CGI.escape(s.to_s)
  end
end