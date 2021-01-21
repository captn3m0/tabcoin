# frozen_string_literal: true

require "httparty"

module Tabcoin
  # Base class for making requests
  class Request
    include HTTParty
    base_uri "https://app.cointab.in:52270/sdk/"

    DEFAULT_HEADERS = {
      Util.header_key(:App_uuid) => Constants::APP_UUID
    }.freeze

    def initialize; end
  end
end
