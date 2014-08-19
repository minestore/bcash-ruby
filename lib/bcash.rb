require 'bcash/version'

module Bcash
  class << self
    attr_accessor :email, :token, :key

    def configure
      yield self
      true
    end
  end

  autoload :Client, "bcash/client"
end
