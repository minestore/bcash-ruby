module Bcash::Helpers::Request
  private

  def json_request(verb, method, data, options = {})
    options.merge! headers: {
      "Authorization" => authorization_key,
    }, body: { data: data.to_json }

    self.class.send(verb, "/#{method}/json", options)
  end

  def authorization_key
    "Basic #{Base64.strict_encode64("#{email}:#{token}")}"
  end
end
