source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3'
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'bootstrap-sass', '~> 3.2.0'
gem 'bootstrap_form', '2.1.1'
gem 'figaro', '0.7.0'
gem 'mini_magick', '3.8.0'
gem 'stripe', '1.15.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '3.1.2'
gem 'jquery-ui-rails', '5.0.0'

gem 'kaminari', '0.16.1'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.4.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'carrierwave-dropbox', '1.2.1'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :development, :test do
  gem 'rspec-rails', '2.14.1'
  gem 'spring-commands-rspec'
  gem 'rb-fsevent' if `uname` =~ /Darwin/
  gem 'fabrication', '2.11.3'
end

group :development do
  gem 'sqlite3'
  gem 'pry', '0.10.0'
  gem 'pry-nav', '0.2.4'
  gem 'thin', '1.6.2'
  gem "better_errors", "1.1.0"
  gem "binding_of_caller"
  gem "letter_opener", "1.2.0"
  gem 'guard-spork', '~> 1.5.1'
  gem 'guard-rspec', '~> 4.2.4', require: false
end

group :test do
  gem 'shoulda-matchers'
  gem 'capybara', '2.4.1'
  gem 'faker'
  gem 'database_cleaner'
  #gem 'capybara-email', github: 'dockyard/capybara-email'
  #gem 'vcr'
  #gem 'webmock'
  gem 'selenium-webdriver', '2.42.0'
  gem 'capybara-webkit', '1.3.0'
  gem 'spork-rails', '~> 4.0.0'
end
