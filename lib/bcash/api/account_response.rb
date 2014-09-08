module Bcash::Api
  class AccountResponse < Response
    def accounts
      body['accounts'] || []
    end

    def cpf
      body['cpf']
    end

    def email
      body['email']
    end
  end
end
