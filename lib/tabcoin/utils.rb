# frozen_string_literal: true

require_relative "constants"
require "securerandom"

module Tabcoin
  # Utilities class
  class Util
    # Generates the keys for the given header
    def self.header_key(sym)
      "h#{Constants::HEADERS.index(sym) + 1}"
    end

    # Generates request as per our fieldmap
    def self.gen_request(params)
      fields = Constants::FIELDMAP.invert
      req = {}
      params.each_key do |k|
        req[fields[k]] = params[k]
      end
      req
    end

    # Parses the response against the fieldmap
    def self.parse_response(res)
      ress = {}
      res.each_key do |k|
        ress[Constants::FIELDMAP[k]] = res[k]
      end
      ress
    end

    # NPCI-style UUIDs
    def self.uuid
      SecureRandom.uuid.tr("-", "").upcase
    end
  end
end
