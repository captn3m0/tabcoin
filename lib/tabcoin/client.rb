# frozen_string_literal: true

require "httparty"
require "json"

require_relative "constants"
require_relative "utils"

module Tabcoin
  # Base class for making requests
  class Client
    include HTTParty
    format :json
    base_uri "https://app.cointab.in:52270/sdk"

    attr_accessor :device_id, :device_uuid

    # Generates default headers, and adds additional from
    # instance attributes
    # if being used async, ensure @device_id and @device_uuid are not null
    def headers
      # Default Headers + Custom headers
      h = {
        Util.header_key(:App_uuid) => Constants::APP_UUID,
        Util.header_key(:Api_uuid) => Util.uuid,
        "Content-Type" => "application/json"
      }
      h[Util.header_key(:device_uuid)] = @device_uuid unless @device_uuid.nil?
      h
    end

    def initialize
      @device_id = nil
      @device_uuid = nil
    end

    # Takes the body hash, generates proper request from it, and converts it to JSON
    def body(params = {})
      Util.gen_request(params).to_json
    end

    def request(...)
      res = self.class.post(...).body
      Util.parse_response JSON.parse(res)
    end

    def ensure_set(list)
      list.each do |s|
        # TODO: Improve this to actually raise with the correct name
        raise Error, "Missing parameter for this request" if s.nil?
      end
    end

    # Note that sms here is just the verification code
    # without the prefix
    def registration_status(sms)
      ensure_set [@device_id, @device_uuid]
      request(
        "/StatusUserRegistration/#{Constants::API_VERSION}/",
        body: body(LanguageID: 1, ConnectionType: "WIFI", SMSVerificationCode: sms),
        headers: headers
      )
    end

    # Initiates device registration
    def register_device(params)
      ensure_set [@device_id]
      body = request(
        "/RegisterDevice/#{Constants::API_VERSION}/",
        body: body({ DeviceInfo1: @device_id }.merge(params)),
        headers: headers
      )
      @device_uuid = body[:device_uuid]
      body
    end
  end
end
