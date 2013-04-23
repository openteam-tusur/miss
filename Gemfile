source 'http://rubygems.org'

group :development, :test do
  gem 'rspec-rails'
end

group :production do
  gem 'exception_notification_rails3', :require => 'exception_notifier'
  gem 'unicorn', :require => false
end

group :production, :development do
  gem 'pg', :require => false
end

group :test do
  #gem 'capybara'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
  gem 'rr'
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :development do
  gem 'annotate'
  gem 'brakeman'
  gem 'rails3-generators'
  gem 'spork', :require => false
end

group :default do
  gem 'compass'
  gem 'fancy-buttons'
  gem 'formtastic'
  gem 'gilenson'
  gem 'inherited_resources', :git => 'git://github.com/josevalim/inherited_resources'
  gem 'jquery-rails'
  gem 'paperclip'
  gem 'paperclip'
  gem 'rails', '~> 3.0.6'
  gem 'russian', :git => 'git://github.com/tacid/russian'
end
