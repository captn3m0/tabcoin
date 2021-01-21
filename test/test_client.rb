# frozen_string_literal: true
require "minitest/autorun"
require "tabcoin/client"

class TestClient < Minitest::Test
  def setup
    @c = Tabcoin::Client.new
    @c.device_id = "SAMPLEDEVICEID"
  end

  def test_headers
    h = @c.headers("Sample" => "Value")
    assert_equal Tabcoin::Constants::APP_UUID, h["h1"]
    assert_match /[A-F0-9]{32}/, h["h2"]
    assert_equal "application/json", h["Content-Type"]
  end

  def test_body
    body = @c.body({
      :AccountType => "noidea"
    })
    assert_equal body, {"f29"=> "noidea"}.to_json
  end
end
