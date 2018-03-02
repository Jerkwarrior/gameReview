# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
end

gem 'coffee-rails', '~> 4.2'
gem 'devise' # , git: 'https://github.com/plataformatec/devise' Ruby 2.5.0 only
gem 'devise_token_auth'
gem 'omniauth'
gem 'guard-rspec', require: false
gem 'igdb_api', git: 'https://github.com/jerkwarrior/igdb-api-ruby'
gem 'jbuilder', '~> 2.5'
gem 'mysql2'
gem 'paperclip'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'ransack'
gem 'rollbar'
gem 'sass-rails', '~> 5.0'
gem 'therubyracer'
gem 'uglifier', '>= 1.3.0'
gem 'vcr'
gem 'webmock'
gem 'webpacker'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  # gem 'ruby_gntp'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
