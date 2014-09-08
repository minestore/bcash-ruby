module Bcash::Api
  module Accounts
    def search_account_by_cpf(cpf)
      response = json_request :post, 'searchAccount', { cpf: cpf }
      Bcash::Api::AccountResponse.new(response)
    end

    def create_account(data)
      response = json_request :post, 'createAccount', data
      Bcash::Api::AccountResponse.new(response)
    end
  end
end
