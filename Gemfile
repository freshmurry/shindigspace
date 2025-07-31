source 'https://rubygems.org'
ruby '3.2.4'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1.7.10'
gem 'sprockets-rails'
gem 'puma', '~> 5.0'
gem 'jbuilder', '~> 2.11'
gem 'redis', '~> 4.0'
gem 'delayed_job'
gem 'activeadmin', '~> 2.13'

group :development, :test do
  gem 'byebug', platforms: [:mri, :windows]
end

group :development do
  gem 'sqlite3', '~> 1.6'
  gem 'web-console', '>= 4.1.0'
  gem 'listen', '~> 3.3'
  gem 'spring'
end

group :test do
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver', '>= 4.0.0.rc2'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:windows, :jruby]

gem "bootstrap-sass", "~> 3.4.1"
gem "devise", "~> 4.9"

gem 'toastr-rails', '~> 1.0'

gem 'omniauth', '~> 1.9'
gem 'omniauth-facebook', '~> 8.0'

gem 'paperclip', '~> 5.3.0'
gem 'marcel'
gem 'aws-sdk', '~> 2.8'

gem 'geocoder', '~> 1.8'
gem 'jquery-ui-rails', '~> 6.0'

gem 'ransack', '~> 3.1'
gem 'figaro'

group :production do
  gem 'pg', '~> 1.4'
  gem 'rails_12factor'
end

group :test, :development do
  gem 'rspec-rails', '~> 5.0'
  gem 'database_cleaner-active_record', '~> 2.0'
end

gem 'capistrano', '~> 3.17'

#----  AirKONG  -------
gem 'twilio-ruby', '~> 7.0'
gem 'fullcalendar-rails', '~> 3.4.0'
gem 'momentjs-rails', '~> 2.29.1'

gem 'stripe', '~> 8.0'
# gem 'rails-assets-card', source: 'https://rails-assets.org'
# gem 'rails-assets-jquery', source: 'https://rails-assets.org'
gem 'omniauth-stripe-connect', '~> 2.10.1'

gem "chartkick", "~> 4.0"
