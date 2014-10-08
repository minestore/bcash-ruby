module Bcash::Api
  module FindTransaction
    URL = 'https://www.pagamentodigital.com.br/transacao/consulta'

    def find_by_order_id(order_id)
      find(id_pedido: order_id)
    end

    def find_by_transaction_id(transaction_id)
      find(id_transacao: transaction_id)
    end

    private

    def find(options)
      options.merge! tipo_retorno: 2
      response = json_request :post, URL, options
      Bcash::Api::TransactionResponse.new(response)
    end

  end
end
