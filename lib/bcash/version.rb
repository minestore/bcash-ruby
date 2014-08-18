module Bcash
  VERSION = "0.0.1"

  class << self
    attr_accessor :token

    def configure
      yield self
      true
    end
  end
end
