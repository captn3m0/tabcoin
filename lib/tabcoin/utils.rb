# frozen_string_literal: true

require_relative "constants"
require "securerandom"

module Tabcoin
  # Utilities class
  class Util
    def self.header_key(sym)
      "h#{Constants::HEADERS.index(sym) + 1}"
    end

    # This is NPCI-style UUIDs
    def self.uuid
      SecureRandom.uuid.tr("-", "").upcase
    end
  end
end
