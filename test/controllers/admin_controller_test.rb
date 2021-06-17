require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get users_index" do
    get admin_users_index_url
    assert_response :success
  end

end
