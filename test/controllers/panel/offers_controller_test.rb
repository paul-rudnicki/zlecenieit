require 'test_helper'

class Panel::OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get panel_offers_destroy_url
    assert_response :success
  end

end
