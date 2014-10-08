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
    context 'using transaction id' do
    end
  end
end

