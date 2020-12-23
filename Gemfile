source 'https://rubygems.org'

ruby '2.7.2'

gem 'rails', '4.2.11.1'
gem 'rails-api'
gem 'spring', group: :development
gem 'active_model_serializers', git: 'https://github.com/rails-api/active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'has_secure_token'
gem 'warden'
gem 'rollbar', '~> 2.4.0'
gem 'yahoo_weather'
gem 'rubocop'

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'sqlite3'
  gem 'letter_opener'
end

group :production, :staging do
  gem 'pg'
  gem 'rails_12factor'
end
