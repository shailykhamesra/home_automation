ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  fixtures :all

  def login_user
  	login_data = {
      username: "MyString",
      password: "secret",
    }
    post "/login/attempt_login", params: login_data
    assert_redirected_to :index_index
  end
end
