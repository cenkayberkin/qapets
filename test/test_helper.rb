Rails.env = 'test'
require File.expand_path('../../config/environment', __FILE__)
# RAILS_ENV = test
puts "Current Environment: #{Rails.env}"
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  fixtures :all
  Capybara.javascript_driver = :poltergeist

  # def sign_in(user = :user)
  #   visit '/'
  #   fill_in 'Email', with: user.email
  #   fill_in 'Password', with: 'password'
  #   click_on 'Log in'
  # end
end
