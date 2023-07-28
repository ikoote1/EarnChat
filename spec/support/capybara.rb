# spec/support/capybara.rb
require 'capybara/rspec'

Capybara.configure do |config|
  config.default_driver = :selenium # or :rack_test if you don't need a browser
  config.app_host = 'http://localhost:3000' # Set your application's host
end
