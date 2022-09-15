require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get properties_new_url
    assert_response :success
  end
end
