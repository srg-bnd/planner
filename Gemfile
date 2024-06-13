# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false
# Authorization
gem 'cancancan'
# Authentication
gem 'devise'
# Load environment variables
gem 'dotenv-rails'

# For Active Storage
gem 'image_processing'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Json rendering
gem 'rabl', '0.14.2'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'

group :production do
  # Use postgresql as the database for Active Record
  # brew install libpq
  # bundle config build.pg -- --with-pg-config=/opt/homebrew/opt/libpq/bin/pg_config
  gem 'pg', '~> 1.1'
end

group :development, :test do
  # Ruby bindings for the SQLite3 embedded database
  gem 'sqlite3', '~> 1.4'
  # Testing framework
  gem 'rspec-rails'
  # A library for setting up Rails objects as test data
  gem 'factory_bot_rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  # The Listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.3'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # Selenium is a browser automation tool for automated testing of webapps and more
  gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
