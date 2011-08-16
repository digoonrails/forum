source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'
gem 'arel', '2.1.4'

gem 'sqlite3', '1.3.4'

gem 'haml', '3.1.2'
gem 'sass', '3.1.4'

gem 'rails3-generators', '0.17.4'
gem "responders", '0.6.4'

gem 'simple_form', '1.4.2'

gem 'settingslogic', '2.0.6'

gem 'friendly_id', '3.2.1.1'

gem 'devise', '1.4.2'
gem 'warden', '1.0.4'

group :development do
  gem "haml-rails", '0.3.4'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier', '1.0.0'
end

group :production do
  gem 'exception_notification', :git => 'https://github.com/rails/exception_notification.git', :require => 'exception_notifier'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'factory_girl_rails'
  
  gem 'capybara', "1.0.1"
  gem 'database_cleaner', "0.6.7" 
  gem 'cucumber-rails', "1.0.2"
end