require 'base64'

module Bcash
  class Client
    include Helpers::Request
    include Api::Accounts

    attr_reader :token, :key, :email

    def initialize(opts={})
      opts.merge! token: Bcash.token, key: Bcash.key, email: Bcash.email
      @token = opts[:token]
      @key = opts[:key]
      @email = opts[:email]
    end
  end
end
