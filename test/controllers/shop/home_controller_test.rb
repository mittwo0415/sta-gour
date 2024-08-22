require "test_helper"

class Shop::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get shop_home_top_url
    assert_response :success
  end
end
