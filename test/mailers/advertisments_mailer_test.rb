require 'test_helper'

class AdvertismentsMailerTest < ActionMailer::TestCase
  test "new_adverstisment_notify" do
    mail = AdvertismentsMailer.new_adverstisment_notify
    assert_equal "New adverstisment notify", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
