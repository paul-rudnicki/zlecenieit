require 'test_helper'

class AdvertismentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get advertisments_show_url
    assert_response :success
  end

end
