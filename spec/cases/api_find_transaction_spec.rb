#encoding: utf-8
require 'spec_helper'

describe Bcash::Api::FindTransaction do
  let(:email) { 'contato@minestore.com.br' }
  let(:token) { 'AF3AISDkEF92ABCD820C37FEABCE1' }
  let(:client){ Bcash::Client.new(email: email, token: token) }

  describe '#find_by_order_id' do
    context 'when api return matching transaction' do
      let(:order_id) { '1001' }
      it 'must return transaction data' do
        VCR.use_cassette('find_transaction_exists') do
          response = client.find_by_order_id(order_id)
          expect(response).to be_success
          expect(response.transaction).to eq(transaction_response)
        end
      end
    end

    context 'when not matching transaction is returned' do
      let(:order_id) { '12345' }
      it 'must return message and not success' do
        VCR.use_cassette('find_transaction_not_exists') do
          response = client.find_by_order_id(order_id)
          expect(response).to_not be_success
          expect(response.message).to eq('Pedido não localizado')
        end
      end
    end
  end

  describe '#find_by_transaction_id' do
    context 'when api return matching transaction' do
      let(:transaction_id) { '1001' }
      it 'must return transaction data' do
        VCR.use_cassette('find_transaction_by_transaction_id_exists') do
          response = client.find_by_transaction_id(transaction_id)
          expect(response).to be_success
          expect(response.transaction).to eq(transaction_response)
        end
      end
    end

    context 'when not matching transaction is returned' do
      let(:transaction_id) { '12345' }
      it 'must return message and not success' do
        VCR.use_cassette('find_transaction_by_transaction_id_not_exists') do
          response = client.find_by_transaction_id(transaction_id)
          expect(response).to_not be_success
          expect(response.message).to eq('Pedido não localizado')
        end
      end
    end
  end

  def transaction_response
    {
      "id_transacao"=>"123456",
      "data_transacao"=>"07/10/2014",
      "data_credito"=>"22/10/2014",
      "valor_original"=>"5.00",
      "valor_loja"=>"4.77",
      "valor_total"=>"5.00",
      "desconto_programado"=>"0.00",
      "desconto"=>"13.70",
      "acrescimo"=>"0.00",
      "cod_meio_pagamento"=>"1",
      "meio_pagamento"=>"Visa",
      "parcelas"=>"1",
      "cod_status"=>"3",
      "status"=>"Aprovada",
      "data_alteracao_status"=>"07/10/2014 19:16:18",
      "cliente_razao_social"=>"",
      "cliente_nome_fantasia"=>"",
      "cliente_nome"=>"José Comprador",
      "cliente_email"=>"jose@hotmail.com",
      "cliente_rg"=>"237382937",
      "cliente_data_emissao_rg"=>"01/06/2007",
      "cliente_orgao_emissor_rg"=>"SSP",
      "cliente_estado_emissor_rg"=>"PR",
      "cliente_cnpj"=>"",
      "cliente_cpf"=>"07875183952",
      "cliente_sexo"=>"M",
      "cliente_data_nascimento"=>"12/12/1912",
      "cliente_telefone"=>"4133333333",
      "cliente_endereco"=>"Rua Agostinho Carlos, 1001",
      "cliente_complemento"=>"",
      "cliente_bairro"=>"",
      "cliente_cidade"=>"Curitiba",
      "cliente_estado"=>"PR",
      "cliente_cep"=>"80002040",
      "frete"=>"13.70",
      "tipo_frete"=>"PAC",
      "id_pedido"=>"1001",
      "free"=>"",
      "email_vendedor"=>"jose@vendedor.com",
      "pedidos"=>[{"codigo_produto"=>"", "nome_produto"=>"Teste", "qtde"=>"1", "valor_total"=>"5.00", "extra"=>""}]
    }
  end
end
