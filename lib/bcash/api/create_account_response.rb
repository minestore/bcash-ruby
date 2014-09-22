module Bcash::Api
  class CreateAccountResponse < AccountResponse
    def errors
      body['errors']
    end
  end
end
