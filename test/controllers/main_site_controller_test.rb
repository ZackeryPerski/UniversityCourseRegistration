require "test_helper"

class MainSiteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_site_index_url
    assert_response :success
  end

  test "should get my_courses" do
    get main_site_my_courses_url
    assert_response :success
  end
end
