source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }


ruby '2.6.1'

gem 'sqlite3', '~> 1.3.6'
gem 'paperclip', git: "https://github.com/thoughtbot/paperclip.git"
gem 'aws-sdk', '< 2'
gem 'rails', '~> 5.2.2'
gem 'puma', '~> 3.11'
gem 'bootstrap-sass', '~> 3.4.0'
gem 'sassc-rails', '>= 2.0.0'
gem 'twitter-bootstrap-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'haml-rails'
gem 'simple_form'
gem 'exception_notification'
gem 'gmaps4rails'
gem 'devise', git: "https://github.com/plataformatec/devise"
gem 'pacecar'

group :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :deployment do
  gem 'capistrano', '~> 3.8'
  gem 'capistrano-rails', '~> 1.4'
  gem 'capistrano-passenger', '~> 0.2'
  gem 'capistrano-rbenv', '~> 2.1'
  gem 'capistrano-bundler', '~> 1.5'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end

group :production do
     gem 'pg'
end
