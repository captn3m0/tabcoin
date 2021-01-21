# frozen_string_literal: true

require "minitest/autorun"
require "tabcoin/client"
require "tabcoin"

class TestClient < Minitest::Test
  def setup
    @c = Tabcoin::Client.new
    @c.device_id = "SAMPLEDEVICEID"
  end

  def test_headers
    h = @c.headers
    assert_equal Tabcoin::Constants::APP_UUID, h["h1"]
    assert_match(/[A-F0-9]{32}/, h["h2"])
    assert_equal "application/json", h["Content-Type"]
  end

  def test_body
    body = @c.body(
      AccountType: "noidea"
    )
    assert_equal body, { "f29" => "noidea" }.to_json
  end

  def test_ensure
    assert_raises(Tabcoin::Error) do
      @c.registration_status("123")
    end
  end

  # Commented out, since we don't have mocks yet
  # def test_register_device
  #   pp @c.register_device
  # end
  # Sample response:
  #  {:ResponseCode=>"1",
  # :Device_uuid=>"",
  # :SMSVerificationCode=> "",
  # :MobileNumber=>"+",
  # :SMSKeyword=>""}
  # The SMS is $SMSKeyword [SPACE] $SMSVerificationCode
  # and it needs to be sent to $MobileNumber
end
