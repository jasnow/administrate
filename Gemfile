source 'https://rubygems.org'

ruby '2.3.1'

gemspec

gem 'rails', '4.2.6'

gem 'airbrake'
gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'email_validator'
gem 'faker'
gem 'flutie'
gem 'high_voltage'
gem 'i18n-tasks'
gem 'jquery-rails'
gem 'newrelic_rpm'
gem 'pg'
gem 'recipient_interceptor'
gem 'refills'
gem 'simple_form'
gem 'title'
gem 'uglifier'
gem 'unicorn'

gem 'parser'

group :development do
  gem 'web-console'
end

group :development, :test do
  gem 'appraisal'
  gem 'awesome_print'
  gem 'bundler-audit', require: false
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'pry-rails'

  gem 'rspec-rails'
end

group :test do
  gem 'ammeter'
  gem 'capybara-webkit'
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'fuubar'
  gem 'launchy'
  gem 'shoulda-matchers', '~> 2.8.0', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'rack-timeout'
  gem 'rails_stdout_logging'
end
