require 'bcash/version'
require 'active_model'
require 'json'

module Bcash
  class << self
    attr_accessor :email, :token, :key, :sales_channel

    def configure
      yield self
      true
    end
  end

  autoload :Api,     "bcash/api"
  autoload :Client,  "bcash/client"
  autoload :Helpers, "bcash/helpers"
end
