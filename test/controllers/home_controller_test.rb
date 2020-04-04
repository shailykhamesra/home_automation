require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  setup do
    login_user
  end

  test "should get index" do
    get home_index_url
    assert_response :success
  end

end
