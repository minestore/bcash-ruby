module Bcash::Api
  class TransactionResponse < Response
    def errors
      body['erro']
    end

    def message
      success ? '' : errors['descricao']
    end
    
    def transaction
      success ? body['transacao'] : nil
    end
  end
end
