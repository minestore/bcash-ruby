module Bcash::Helpers::Request
  private

  def json_request(verb, method, data, options = {})
    ensure_email_and_token_are_set!

    options.merge! headers: {
      "Authorization" => authorization_key,
    }, body: data

    self.class.send(verb, method, options)
  end

  def assert_valid_keys(hash, *valid_keys)
    valid_keys_text = "Valid keys are: #{valid_keys.join(", ")}"
    if hash.empty?
      raise(ArgumentError, "Keys are required. #{valid_keys_text}")
    else
      unknown_keys = hash.keys - [valid_keys].flatten
      raise(ArgumentError, "Unknown key(s): #{unknown_keys.join(", ")}. #{valid_keys_text}") unless unknown_keys.empty?
    end
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
