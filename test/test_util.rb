# frozen_string_literal: true

require "minitest/autorun"
require "tabcoin/utils"

class TestUtil < Minitest::Test
  def test_uuid
    assert_equal 32, Tabcoin::Util.uuid.length
    assert_match /[A-F0-9]{32}/, Tabcoin::Util.uuid
  end
  def test_response_parsing
    res = Tabcoin::Util.parse_response({
      "f1"=>"1",
      "h3"=>"ABC",
      "f10"=>"SMS",
      "f13"=>"XYZ",
      "f236"=>"upi"
    })
    assert_equal res, {
      ResponseCode:"1",
      Device_uuid:"ABC",
      SMSVerificationCode:"SMS",
      MobileNumber:"XYZ",
      SMSKeyword:"upi"
    }
  end
end
