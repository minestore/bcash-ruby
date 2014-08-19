module Bcash::Helpers::Request
  include HTTParty

  base_uri "https://api.bcash.com.br/service"
  default_timeout 20
  format :json

  private

  def json_request(verb, method, options={}, &block)
    options[:headers]["Authorization"] = authorization_key
    self.class.send(verb, "/#{method}/json", options, block)
  end

  def authorization_key
    "Basic #{Base64.encode64("#{email}:#{token}")}"
  end
end
