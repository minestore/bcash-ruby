module Bcash
  class Client
    include HTTParty
    attr_reader :token, :key, :email

    base_uri "https://api.bcash.com.br/service"
    format :json

    def initialize(opts={})
      opts.merge! token: Bcash.token, key: Bcash.key, email: Bcash.email
      @token = opts[:token]
      @key = opts[:key]
      @email = opts[:email]
    end

    def create_account
    end
  end
end
