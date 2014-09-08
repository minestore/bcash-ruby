require 'base64'
require 'httparty'

module Bcash
  class Client
    include HTTParty
    include Helpers::Request
    include Api::Accounts

    base_uri "https://api.bcash.com.br/service"
    default_timeout 20
    format :json

    attr_reader :token, :key, :email

    def initialize(opts={})
      opts = { token: Bcash.token, key: Bcash.key, email: Bcash.email }.merge(opts)
      @token = opts[:token]
      @key = opts[:key]
      @email = opts[:email]
    end

    def ensure_email_and_token_are_set!
      if email.blank?
        raise StandardError, 'Bcash email is not set'
      elsif token.blank?
        raise StandardError, 'Bcash token is not set'
      end
    end
  end
end
