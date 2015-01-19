module Bcash::Api
  class CreateAccountResponse < AccountResponse
    def errors
      body['errors'] || body['list']
    end
  end
end
