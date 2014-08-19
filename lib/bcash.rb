require 'bcash/version'

module Bcash
  class << self
    BASE_URL = "http://api.bcash.com.br/service/"

    attr_accessor :email, :token, :secret

    def configure
      yield self
      true
    end
  end

  autoload :Client, "bcash/client"
end
