# frozen_string_literal: true

require "minitest/autorun"
require "tabcoin/utils"
require "tabcoin/client"

class TestConstants < Minitest::Test
  def test_headers
    assert_equal "h1", Tabcoin::Util.header_key(:App_uuid)
  end
end
