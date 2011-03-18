source "http://gems.openteam.ru"

gem "rails"

group :development, :test do
  gem 'rspec-rails'
end

group :production do
  gem "exception_notification_rails3", :require => "exception_notifier"
end

group :production, :development do
  gem "pg", :require => false
end

group :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'capybara'
  gem 'rr'
  gem 'faker'
  gem 'launchy'
  gem 'factory_girl_rails'
end

group :development do
  gem "rails3-generators"
  gem "spork", :require => false
  gem "annotate"
end

# compatibility with jQuery
gem "jquery-rails"

# GUI
gem "compass"
gem "fancy-buttons"
gem "formtastic"

# attachment
gem "paperclip"

#inherited_resources
gem 'inherited_resources',          :git => 'git://github.com/josevalim/inherited_resources'

#localization
gem 'russian'

