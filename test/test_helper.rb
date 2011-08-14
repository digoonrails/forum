ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def login_as(user)
    @request.session[:user_id] = user ? users(user).id : nil
    @request.session[:topics] = {}
  end
  
  def logout
    @request.session[:user_id] = nil
    @controller.instance_variable_set("@current_user", nil)
  end
end
