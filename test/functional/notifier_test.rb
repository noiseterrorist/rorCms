require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "confirm_email" do
    mail = Notifier.confirm_email
    assert_equal "Confirm email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
