# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.6.6"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 6.0.3"

gem "secure_headers"

# Use PostgreSQL as the database for Active Record
gem "pg", ">= 0.18", "< 2.0"
gem "strong_migrations"

# Use Puma as the app server
gem "puma", "~> 5.1"

# Use SCSS for stylesheets
gem "sass-rails", "~> 6"

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker", "~> 5.2"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "turbolinks", "~> 5"

gem "slim-rails"

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "jbuilder", "~> 2.10"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "pry-rails"

  gem "rspec-rails"
  gem "spring-commands-rspec"

  gem "codecov", require: false
  gem "simplecov", require: false

  gem "factory_bot_rails"
  gem "faker"

  gem "annotate"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  gem "listen", "~> 3.3"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the
  # background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false

  gem "brakeman"

  gem "slim_lint"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
