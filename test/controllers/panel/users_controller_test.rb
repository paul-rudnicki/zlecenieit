require 'test_helper'

class Panel::UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get panel_users_edit_url
    assert_response :success
  end

  test "should get update" do
    get panel_users_update_url
    assert_response :success
  end

end
