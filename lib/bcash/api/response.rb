module Bcash::Api
  class Response
    attr_accessor :body, :http_code

    def initialize(response)
      if response.success?
        parse_body(response)
      else
        raise message
      end
    end

    def code
      body['code'].to_i
    end
    
    def message
      body['message']
    end

    def parse_body(response)
      @body = CGI::unescape(response.body)
      @body = JSON::parse body
    end
  end
end
