module Bcash::Api
  module Accounts
    def search_account(cpf)
      json_request :get, 'searchAccount', body: { cpf: cpf }
    end

    def create_account(data)
      json_request :post, 'createAccount'
    end
  end
end
