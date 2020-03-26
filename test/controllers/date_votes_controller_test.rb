require 'test_helper'

class DateVotesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get date_votes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get date_votes_destroy_url
    assert_response :success
  end

end
