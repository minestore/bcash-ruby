module Bcash::Api
  module VerifyReturn
    VERIFY_URL = 'https://www.bcash.com.br/checkout/verify/'
    def verify_return(data={})
      assert_valid_keys(data,:transacao, :status, :cod_status, :valor_original, :valor_loja, :token)
      response = HTTParty.post VERIFY_URL, body: data
      Bcash::Api::VerifyReturnResponse.new(response)
    end
  end
end
