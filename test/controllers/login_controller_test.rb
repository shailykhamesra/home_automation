require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get login_login_url
    assert_response :success
  end

  test "should login to system" do
  	post login_attempt_login_url, params: { username: 'MyString', password: 'secret'}
  	assert_redirected_to index_index_url
  end

end
