require 'test_helper'

class Panel::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get panel_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get panel_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get panel_sessions_destroy_url
    assert_response :success
  end

end
