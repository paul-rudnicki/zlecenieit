require 'test_helper'

class Panel::DashboardsControllerTest < ActionDispatch::IntegrationTest
  test "should get cockpit" do
    get panel_dashboards_cockpit_url
    assert_response :success
  end

  test "should get advertisments" do
    get panel_dashboards_advertisments_url
    assert_response :success
  end

  test "should get offers" do
    get panel_dashboards_offers_url
    assert_response :success
  end

  test "should get profile" do
    get panel_dashboards_profile_url
    assert_response :success
  end

  test "should get settings" do
    get panel_dashboards_settings_url
    assert_response :success
  end

  test "should get verify" do
    get panel_dashboards_verify_url
    assert_response :success
  end

end
