require 'test_helper'

class LocationChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get location_choices_create_url
    assert_response :success
  end

end
