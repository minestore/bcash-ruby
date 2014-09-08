module Bcash::Helpers::Request
  private

  def json_request(verb, method, data, options = {})
    ensure_email_and_token_are_set!

    options.merge! headers: {
      "Authorization" => authorization_key,
    }, body: { data: data.to_json }

    self.class.send(verb, "/#{method}/json", options)
  end

  def ensure_email_and_token_are_set!
    if email.blank?
      raise StandardError, 'Bcash email is not set'
    elsif token.blank?
      raise StandardError, 'Bcash token is not set'
    end
  end

  def authorization_key
    "Basic #{Base64.strict_encode64("#{email}:#{token}")}"
  end
end
