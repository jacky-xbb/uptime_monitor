require "test_helper"

class PingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get pings_create_url
    assert_response :success
  end
end
