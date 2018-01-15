# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Rails
gem "rails", "~> 5.1.4"

# Database
# pg gem 1.0 is not compatible with rails 5.1.4
gem "pg", "~> 0.18"

# Server
gem "puma"

# Assets
gem "coffee-rails"
gem "sass-rails"
gem "uglifier"

gem "bcrypt"
gem "turbolinks"

group :development, :test do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "capybara"
  gem "rspec"
  gem "rubocop", require: false
  gem "rubocop-rspec", require: false
  gem "selenium-webdriver"
end

group :development do
  gem "better_errors"
  gem "listen"
  gem "web-console"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]