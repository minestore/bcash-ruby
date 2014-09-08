module Bcash::Api
  module Accounts
    def search_account_by_cpf(cpf)
      response = json_request :post, 'searchAccount', { cpf: cpf }
      Bcash::Api::AccountResponse.new(response)
    end
  end
end
