module Bcash::Api
  class Response
    attr_accessor :body, :http_code, :success, :code, :message

    def initialize(response)
      parse_body(response)
    end

    def code
      if success
        body['code'].to_i
      else
        body.values.first.first['code']
      end
    end
    
    def message
      if success
        body['message']
      else
        body.values.first.first['description']
      end
    end

    def success?
      success
    end

    def parse_body(response)
      @body = CGI::unescape(response.body)
      @body = JSON::parse body
      @success = response.success?
    end
  end
end
