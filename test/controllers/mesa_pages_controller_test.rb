require 'test_helper'

class MesaPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get pjs" do
    get mesa_pages_pjs_url
    assert_response :success
  end

  test "should get plot" do
    get mesa_pages_plot_url
    assert_response :success
  end

  test "should get face" do
    get mesa_pages_face_url
    assert_response :success
  end

end
