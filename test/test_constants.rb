# frozen_string_literal: true

require "minitest/autorun"
require "tabcoin/utils"
require "tabcoin/request"

class TestConstants < Minitest::Test
  def test_headers
    assert_equal "h1", Tabcoin::Util.header_key(:App_uuid)
  end
end

class TestUtil < Minitest::Test
  def test_uuid
    assert_equal 32, Tabcoin::Util.uuid.length
    assert_match /[A-F0-9]{32}/, Tabcoin::Util.uuid
  end
end

class TestRequest < Minitest::Test
  def setup
    @r = Tabcoin::Request.new
    @r.device_id = "SAMPLEID"
  end

  def test_headers
    h = @r.headers("Sample" => "Value")
    assert_equal Tabcoin::Constants::APP_UUID, h["h1"]
    assert_match /[A-F0-9]{32}/, h["h2"]
    assert_equal "application/json", h["Content-Type"]
  end
end
