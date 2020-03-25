require 'test_helper'

class DateChoicesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get date_choices_create_url
    assert_response :success
  end

end
