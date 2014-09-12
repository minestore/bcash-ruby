module Bcash::Api
  class Response
    attr_accessor :body, :http_code, :success, :code, :message

    def initialize(response)
      self.success = false
      @http_code = response.code
      parse_body(response)
    end

    def code
      success ? body['code'] : value_from_errors('code') 
    end
    
    def message
      success ? body['message'] : value_from_errors('description')
    end

    def errors
      body['list']
    end

    def success?
      success
    end

    private

    def parse_body(response)
      @body = CGI::unescape(response.body)
      @body = JSON::parse body
      @success = response.success?
    end

    def value_from_errors(value)
      if errors.size > 1
        errors.collect {|e| e[value] }
      else
        errors[0][value]
      end
    end

  end
end
