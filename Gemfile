source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'faraday'
gem 'graphql'
gem 'jbuilder', '~> 2.5'
gem 'jwt'
gem 'nokogiri'
gem 'pg'
gem 'postmark-rails'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.2'
gem 'rest-client'
gem 'sidekiq'
gem 'timezone'

group :development, :test do
  gem 'awesome_print', require: 'ap'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'rubocop', require: true
end

group :development do
  gem 'capistrano', '~> 3.6'
  gem 'capistrano-rails', '~> 1.3'
  gem 'listen'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'tzinfo-data', '~> 1.2016', '>= 1.2016.1'

gem 'graphiql-rails', group: :development
