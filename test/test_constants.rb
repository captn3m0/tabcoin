# frozen_string_literal: true

require "minitest/autorun"
require "tabcoin/utils"

class TestConstants < Minitest::Test
  def test_headers
    assert_equal "h1", Tabcoin::Util.header_key(:App_uuid)
  end
end

class TestUtil < Minitest::Test
  def test_uuid
    assert_equal 32, Tabcoin::Util.uuid.length
  end
end