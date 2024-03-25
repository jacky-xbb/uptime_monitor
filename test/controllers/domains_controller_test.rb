require "test_helper"

class DomainsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get domains_new_url
    assert_response :success
  end

  test "should get create" do
    get domains_create_url
    assert_response :success
  end

  test "should get update" do
    get domains_update_url
    assert_response :success
  end

  test "should get show" do
    get domains_show_url
    assert_response :success
  end
end
