#encoding: utf-8
require 'spec_helper'

describe Bcash::Api::VerifyReturn do
  let(:client){ Bcash::Client.new }
  let(:data){
    {
      transacao: '2833',
      status: 'Transação em Andamento',
      cod_status: '0',
      valor_original: '2145.23',
      valor_loja: '2083.23',
      token:  '1211CF51917E074BC3784592C71FC'
    }
  }

  describe '#verify_return' do
    context 'when data is valid' do
      it 'must return VERIFICADO from response and return verified is true' do
        VCR.use_cassette('verify_return_verified') do
          response = client.verify_return(data)
          expect(response).to be_verified
          expect(response.message).to eq('VERIFICADO')
        end
      end
    end

    context 'when data is not valid, request is not from bcash' do
      it 'must return error messages and return false for verified? method' do
        VCR.use_cassette('verify_return_not_verified') do
          data[:valor_loja] = '11'
          response = client.verify_return(data)
          expect(response).to_not be_verified
        end
      end
    end
  end
end

