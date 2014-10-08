module Bcash::Api
  module FindTransaction
    URL = 'https://www.pagamentodigital.com.br/transacao/consulta'

    def find_by_order_id(order_id)
      response = json_request :post, URL, { id_pedido: order_id, tipo_retorno: 2 }
      Bcash::Api::TransactionResponse.new(response)
    end
  end
end
