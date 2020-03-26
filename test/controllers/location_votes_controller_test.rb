require 'test_helper'

class LocationVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get location_votes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get location_votes_destroy_url
    assert_response :success
  end

end
