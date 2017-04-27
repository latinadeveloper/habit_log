source 'http://rubygems.org'

gem 'sinatra'
gem 'rack-flash3'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'

gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"


group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end


group :development do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
end
