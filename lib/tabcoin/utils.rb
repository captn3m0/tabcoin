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
    def self.gen_request(h)
      fields = Constants::FIELDMAP.invert
      hh = {}
      h.each_key do |k|
        hh[fields[k]] = h[k]
      end
      hh
    end

    # Parses the response against the fieldmap
    def parse_response(res)
      ress = {}
      res.each_key do |k|
        ress[Constants::FIELDMAP[k]] = res.delete[k]
      end
      ress
    end

    # NPCI-style UUIDs
    def self.uuid
      SecureRandom.uuid.tr("-", "").upcase
    end
  end
end
