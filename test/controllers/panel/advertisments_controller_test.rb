require 'test_helper'

class Panel::AdvertismentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get panel_advertisments_new_url
    assert_response :success
  end

  test "should get create" do
    get panel_advertisments_create_url
    assert_response :success
  end

  test "should get edit" do
    get panel_advertisments_edit_url
    assert_response :success
  end

  test "should get update" do
    get panel_advertisments_update_url
    assert_response :success
  end

end
