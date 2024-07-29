source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Rails Framework
gem 'rails', '~> 6.1.7', '>= 6.1.7.8'

# Database
gem 'sqlite3', '~> 1.4' # Use SQLite3 as the database for Active Record

# Application Server
gem 'puma', '~> 3.11' # Use Puma as the app server
gem 'ffi', '~> 1.14.2'

# Stylesheets
gem 'sassc-rails', '< 2.2.0' # Use SCSSC for stylesheets
gem 'bootstrap', '~> 5.0.0' # Bootstrap framework
gem 'jquery-rails'

# JavaScript Transpilation
gem 'webpacker', '~> 5.0' # Transpile app-like JavaScript

# Hotwire (Turbo and Stimulus for real-time features)
gem 'hotwire-rails'

# API Builder
gem 'jbuilder', '~> 2.7' # Build JSON APIs with ease

# Authentication
gem 'devise' # Flexible authentication solution for Rails
gem 'devise-i18n' # Devise internationalization

# Authorization
gem 'pundit' # Object-oriented authorization for Rails applications

# Tagging
gem 'acts-as-taggable-on' # Tagging functionality

gem 'acts_as_favoritor'  # For favorites functionality

# Search functionality
gem 'ransack' # Object-based searching

# Form helpers
gem 'simple_form' # Forms made easy

# Pagination
gem 'kaminari' # Pagination library for Rails
gem 'bootstrap5-kaminari-views'

# Admin interface
gem 'activeadmin' # Ruby on Rails framework for creating elegant backends

# OmniAuth providers
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'

# Performance
gem 'bootsnap', '>= 1.4.4', require: false # Reduces boot times through caching

# Environment variables management
gem 'dotenv-rails' # Loads environment variables from .env

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw] # Debugging
  gem 'factory_bot_rails' # Test fixtures replacement
  gem 'rspec-rails' # Testing framework

  # Code Quality Tools
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
  gem 'listen', '~> 3.7' # Listen to file modifications
#  gem 'rack-mini-profiler', '~> 2.0' # Display performance information
  gem 'spring' # Speeds up development by keeping your application running in the background
  gem 'spring-watcher-listen'
end

group :test do
  gem 'capybara', '>= 3.26' # Integration testing tool
  gem 'selenium-webdriver', '>= 4.0.0.rc1' # Selenium WebDriver for Capybara
  gem 'webdrivers' # Easy installation and use of web drivers to run system tests
end

# Windows support
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'image_processing', '~> 1.2' # Image processing for ActiveStorage
gem 'mini_magick', '~> 4.11'

gem 'font-awesome-sass', '~> 6.5.2'

gem 'active_storage_validations'

group :production do
  gem 'mysql2', '0.5.6'
end

gem "net-smtp"
gem "net-pop"
gem "net-imap"

