require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "vote_casted" do
    mail = UserMailer.vote_casted
    assert_equal "Vote casted", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
