# frozen_string_literal: true

require "httparty"
require "json"

module Tabcoin
  # Base class for making requests
  class Client
    include HTTParty
    format :json
    base_uri "https://app.cointab.in:52270/sdk"

    attr_writer :device_id

    # Generates default headers, and merges custom ones
    def headers(h = {})
      # Default Headers + Custom headers
      {
        Util.header_key(:App_uuid) => Constants::APP_UUID,
        Util.header_key(:Api_uuid) => Util.uuid,
        "Content-Type" => "application/json"
      }.freeze.merge(h)
    end

    # Takes the body hash, generates proper request from it, and converts it to JSON
    def body(h = {})
      Util.gen_request(h).to_json
    end

    def request(...)
      res = self.class.post(...).body
      Util.parse_response JSON.parse(res)
    end

    # Initiates device registration
    def RegisterDevice
      request(
        "/RegisterDevice/#{Constants::API_VERSION}/",
        body: body(DeviceInfo1: @device_id),
        headers: headers
      )
    end
  end
end
