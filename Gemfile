source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.2'
gem 'pg'
gem 'puma', '~> 3.0'
gem 'pkg-config', '~> 1.1', '>= 1.1.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'figaro'
gem 'bourbon', '~> 4.3', '>= 4.3.3'
gem 'neat', '~> 2.0'
gem 'rest-client', '~> 2.0', '>= 2.0.1'
gem 'devise'
gem 'omniauth-500px', git: 'git://github.com/arthurnn/omniauth-500px.git'
gem 'font-awesome-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_girl_rails', '~> 4.8'
  gem 'capybara', '~> 2.13'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
