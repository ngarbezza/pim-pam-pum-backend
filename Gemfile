source 'https://rubygems.org'

ruby '2.6.6'

gem 'rails', '6.1.7.4'
gem 'rails-api'
gem 'spring', group: :development
gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.18'
gem 'has_secure_token'
gem 'rubocop'
gem 'warden'
gem 'rollbar', '~> 2.4.0'
gem 'yahoo_weather'

group :development, :test do
  gem 'rspec-rails', '~> 4.1'
  gem 'sqlite3'
  gem 'letter_opener'
end

group :production, :staging do
  gem 'pg'
  gem 'rails_12factor'
end
