require 'test_helper'

class GeolocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get geolocations_show_url
    assert_response :success
  end

end
