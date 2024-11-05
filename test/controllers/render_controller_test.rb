require "test_helper"

class RenderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get render_index_url
    assert_response :success
    assert_select "title", "Ruby on Rails Tutorial Sample App"
  end
end
