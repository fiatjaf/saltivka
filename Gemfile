source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.5"
gem "turbo-rails"
gem "stimulus-rails"

gem "bootsnap", require: false

gem "importmap-rails"
gem "sprockets-rails"

gem "puma", "~> 5.0"
gem "faye-websocket"
gem "pg", "~> 1.1"
gem "redis", "~> 5.0"
gem "sidekiq", "~> 7"

gem "dry-validation"
gem "jbuilder"


group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
