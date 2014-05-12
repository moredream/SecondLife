source 'https://rubygems.org'

ruby "2.1.0"
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1'

# Use postgresql as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'rails_12factor', group: :production
gem 'puma'

gem 'fog'

# User & Authentication
gem 'devise'
gem 'omniauth-facebook'
gem 'figaro'

#Attachments
gem 'carrierwave'
gem 'mini_magick'
gem 'carrierwave_direct'
gem 'remotipart', '~> 1.2'
gem 'sidekiq'
gem 'redis'
gem 'bootstrap-sass'
gem 'dalli'

gem 'kaminari'
gem 'acts_as_votable', '~> 0.8.0'

gem "acts_as_follower"
gem 'acts-as-taggable-on'

group :staging do
  gem 'ruby-prof'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end

group :test do
  gem "factory_girl_rails"
  gem "capybara"
  gem "guard-rspec"
end

gem 'rack-mini-profiler', :group => [:test, :development,:staging]
gem 'bullet', :group => [:test, :development, :staging]
 
# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.1.2'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
