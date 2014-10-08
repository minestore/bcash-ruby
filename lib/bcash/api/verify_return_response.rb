module Bcash::Api
  class VerifyReturnResponse < Response
    def verified?
      message == 'VERIFICADO'
    end

    def message
      body
    end

    private

    def parse_body(response)
      @body = CGI::unescape(response.body)
      @success = response.success?
    end
  end
end
