module Bcash
  class Client
    attr_reader :token, :secret, :email

    def initialize(opts={})
      opts.merge! token: Bcash.token, secret: Bcash.secret, email: Bcash.email
      @token = opts[:token]
      @secret = opts[:secret]
      @email = opts[:email]
    end
  end
end
