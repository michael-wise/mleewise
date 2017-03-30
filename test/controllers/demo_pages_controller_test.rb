require 'test_helper'

class DemoPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get template" do
    get demo_pages_template_url
    assert_response :success
  end

end
