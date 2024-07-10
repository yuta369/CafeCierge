source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'rails', '~> 6.1.7', '>= 6.1.7.8'
gem 'pg', '>= 0.18', '< 2.0' # Use PostgreSQL as the database for Active Record
gem 'puma', '~> 5.0' # Use Puma as the app server
gem 'sassc-rails', '>= 2.1' # Use SCSSC for stylesheets
gem 'webpacker', '~> 5.0' # Transpile app-like JavaScript
gem 'jbuilder', '~> 2.7' # Build JSON APIs with ease
gem 'hotwire-rails'
gem 'bootstrap', '~> 5.0.0'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'kaminari'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Authentication
gem 'devise'

# Authorization
gem 'pundit'

# Tagging
gem 'acts-as-taggable-on'

# Search functionality
gem 'ransack'

# Form helpers
gem 'simple_form'

# Admin interface
gem 'activeadmin'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Debugging
  gem 'dotenv-rails' # Loads environment variables from .env
  gem 'factory_bot_rails' # Test fixtures replacement
  gem 'rspec-rails' # Testing framework
  gem 'prettier' # Code formatter
  gem 'rubocop', require: false # Ruby static code analyzer
  gem 'rubocop-performance', require: false # RuboCop extension focused on performance
  gem 'rubocop-rails', require: false # RuboCop extension for Ruby on Rails
  gem 'rubocop-rspec', require: false # RuboCop extension for RSpec
  gem 'rubocop-capybara', require: false # RuboCop extension for Capybara
  gem 'rubocop-factory_bot', require: false # RuboCop extension for FactoryBot
end

group :development do
  gem 'web-console', '>= 4.1.0' # Access an interactive console on exception pages
  gem 'listen', '~> 3.3' # Listen to file modifications
  gem 'rack-mini-profiler', '~> 2.0' # Display performance information
  gem 'spring' # Speeds up development by keeping your application running in the background
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara', '>= 3.26' # Integration testing tool
  gem 'selenium-webdriver', '>= 4.0.0.rc1' # Selenium WebDriver for Capybara
  gem 'webdrivers' # Easy installation and use of web drivers to run system tests
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
