source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'rails-api'
gem 'spring', :group => :development
gem 'active_model_serializers', github: 'rails-api/active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'has_secure_token'
gem 'warden'
gem 'rollbar', '~> 2.4.0'
gem 'yahoo_weather'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'sqlite3'
  gem 'letter_opener'
end

group :production, :staging do
  gem 'pg'
  gem 'rails_12factor'
end

ruby '2.2.2'
