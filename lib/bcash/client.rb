require 'base64'

module Bcash
  class Client
    include HTTParty

    attr_reader :token, :key, :email

    base_uri "https://api.bcash.com.br/service"
    default_timeout 20
    format :json

    def initialize(opts={})
      opts.merge! token: Bcash.token, key: Bcash.key, email: Bcash.email
      @token = opts[:token]
      @key = opts[:key]
      @email = opts[:email]
    end

    def create_account(data)
      json_post 'createAccount'
    end

    def json_post(method, options={}, &block)
      options[:headers]["Authorization"] = authorization_key
      self.class.post("/#{method}/json", options, block)
    end

    private

    def authorization_key
      "Basic #{Base64.encode64("#{email}:#{token}")}"
    end
  end
end
