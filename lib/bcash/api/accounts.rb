module Bcash::Api
  module Accounts
    def search_account_by_cpf(cpf)
      response = json_request :post, 'searchAccount', { cpf: cpf }
      Bcash::Api::AccountResponse.new(response)
    end

    def create_account(data)
      data = Bcash::Api::AccountCreationRequest.new(data)

      if data.valid?
        response = json_request :post, 'createAccount', data
        Bcash::Api::CreateAccountResponse.new(response)
      else
        Bcash::Api::AccountNotValidResponse.new(data)
      end
    end
  end
end
