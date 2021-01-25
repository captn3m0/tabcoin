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
    base_uri "https://app.cointab.in:52270"

    attr_accessor :device_id, :device_uuid, :user_uuid, :account_code

    # Generates default headers, and adds additional from
    # instance attributes
    # if being used async, ensure @device_id and @device_uuid are not null
    def headers
      # Default Headers + Custom headers
      h = {
        Util.header_key(:app_uuid) => Constants::APP_UUID,
        Util.header_key(:api_uuid) => Util.uuid,
        "Content-Type" => "application/json"
      }
      # h3 and h4
      h[Util.header_key(:device_uuid)] = @device_uuid unless @device_uuid.nil?
      h[Util.header_key(:user_uuid)] = @user_uuid unless @user_uuid.nil?
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
      ensure_set [@device_uuid]
      body = request(
        "/sdk/StatusUserRegistration/#{Constants::API_VERSION}/",
        body: body(LanguageID: 1, ConnectionType: "WIFI", SMSVerificationCode: sms),
        headers: headers
      )
      @user_uuid = body[:user_uuid] if body[:user_uuid]
      body
    end

    # Initiates device registration
    def register_device(params)
      ensure_set [@device_id]
      body = request(
        "/sdk/RegisterDevice/#{Constants::API_VERSION}/",
        body: body({ DeviceInfo1: @device_id }.merge(params)),
        headers: headers
      )
      @device_uuid = body[:device_uuid]
      body
    end

    def check_vpa(vpa)
      ensure_auth
      res = request(
        "/sdk/CheckVPA/#{Constants::API_VERSION}/",
        body: body(VPA: vpa),
        headers: headers
      )

      sleep 0.5
      request(
        "/sdk/StatusCheckVPA/#{Constants::API_VERSION}/",
        body: body(APICode: res[:APICode]),
        headers: headers
      )
    end

    def ensure_auth
      ensure_set [@device_uuid, @user_uuid]
    end

    def txn_history
      ensure_auth
      res = request(
        "/api/TransactionHistory/#{Constants::API_VERSION}/",
        body: body(SkipTransactions: []),
        headers: headers
      )

      res[:Transactions].map! do |txn|
        Util.parse_response(txn)
      end
      res
    end

    # Raise collect request
    def collect_request(vpa, amount, description, expiry = 5)
      ensure_auth
      ensure_set [@account_code]
      params = {
        AccountCode: @account_code,
        ActivityUUID: Util.uuid,
        Amount: amount,
        Description: description,
        ExpiringIn: expiry,
        VPA: vpa
      }
      request(
        "/sdk/CollectVPA/#{Constants::API_VERSION}/",
        body: body(params),
        headers: headers
      )
    end
  end
end
