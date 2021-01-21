# frozen_string_literal: true

require_relative "constants"

module Tabcoin
  # Utilities class
  class Util
    def self.header_key(sym)
      "h#{Tabcoin::HEADERS.index(sym) + 1}"
    end
  end
end
