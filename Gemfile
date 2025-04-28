# frozen_string_literal: true

source "https://rubygems.org"

# Ruby and Rails Version
ruby "3.2.8"
gem "rails", "~> 7.0"

# Dependency Management
gem "bundler", "~> 2.1.4"

# Error Tracking & Monitoring
gem "airbrake"
gem "newrelic_rpm"

# Database & ORM
gem "delayed_job_active_record"
gem "paranoia", ">= 2.6.0", "< 3.0"

gem "pg", "~> 1.4"
gem "ranked-model"

# Authentication & Authorization
gem "devise", "~> 4.7" # or another version compatible with Rails 5.2
gem "omniauth", "~> 1.9", ">= 1.9.1"
gem "omniauth-facebook"
gem "omniauth-twitter"

# API & External Requests
gem "aws-sdk"
gem "faraday", "~> 2.0" # This should support Ruby 2.7
gem "figaro" # Environment variable management
gem "geocoder"

# Background Jobs & Scheduling
gem "clockwork"

# Friendly URLs & Routing
gem "friendly_id", "~> 5.4"

# Frontend & Views
gem "haml-rails", "~> 2.1"

gem "jquery-rails"
gem "jquery-ui-rails"
gem "rails_autolink"
gem "sass-rails" # , '~> 3.2.3'

# Performance & Caching
gem "bootsnap", require: false
gem "rails-autoscale-web"
gem "ruby-prof"

# Debugging & Console Enhancements
gem "byebug"
gem "pry-rails"

# Pagination
gem "will_paginate", "~> 3.0"

# JSON & API Helpers
gem "multi_json"
gem "rails-controller-testing", github: "rails/rails-controller-testing"

# Security & Encryption
gem "bigdecimal", ">= 3.0"

# Linting & Testing
gem "haml-lint", require: false
gem "rails-perftest"
gem "rubocop", "~> 1.0"
gem "test-unit"

# Web Server
gem "puma"

# Provides helper methods to generate HTML tags for records
gem "record_tag_helper", "~> 1.0"

# Asset Management
gem "sprockets-rails"
gem "webpacker"

# Helfpul Error messages
gem 'did_you_mean', '~> 1.0'

# Asset Pipeline
group :assets do
  # gem 'therubyracer'
  # gem 'less-rails'
  gem "coffee-rails" # , '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem "uglifier", "~> 3.2.0"
end

# Development Tools
group :development do
  # gem 'letter_opener' # Uncomment if needed for email previewing
end

# Miscellaneous & Legacy
# gem 'aws-s3'
# gem 'protected_attributes'
# gem 'bcrypt-ruby', '~> 3.0.0'
# gem 'jbuilder'
# gem 'unicorn'
# gem 'capistrano'
# gem 'debugger'
