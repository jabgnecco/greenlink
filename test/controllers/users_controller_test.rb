require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_donations" do
    get users_my_donations_url
    assert_response :success
  end
end
