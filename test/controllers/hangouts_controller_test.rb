require 'test_helper'

class HangoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get hangouts_show_url
    assert_response :success
  end

  test "should get new" do
    get hangouts_new_url
    assert_response :success
  end

  test "should get create" do
    get hangouts_create_url
    assert_response :success
  end

end
