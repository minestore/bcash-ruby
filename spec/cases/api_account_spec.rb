require 'spec_helper'

describe Bcash::Api::Accounts do
  let(:email) { 'contato@minestore.com.br' }
  let(:token) { 'AF3AISDkEF92ABCD820C37FEABCE1' } 
  let!(:client){ Bcash::Client.new(email: email, token: token) }

  describe 'search_account' do
    context 'when match one customer' do
      it 'should be able to retrieve customer info' do
        VCR.use_cassette('search_account_return_one') do
          cpf = '07411111111'
          response = client.search_account_by_cpf(cpf)
          expect(response.code).to eq(1)
          expect(response.message).to eq('Foi encontrado 1 registro para o CPF ou email informado!')
          expect(response.cpf).to eq(cpf)
          expect(response.accounts.size).to eq(1)
          expect(response.accounts.first).to eq({"mail" => 'pessoa@hotmail.com', "token" => 'kx4F3mkZDlGUejQNKWdnP5Ttmk', "idClient" => '205' })
        end
      end
    end

    context 'when match more than one customer' do
      it 'should be able to retrieve customer info from all customers' do
        VCR.use_cassette('search_account_return_mutiple') do
          cpf = '07822222222'
          response = client.search_account_by_cpf(cpf)
          expect(response.code).to eq(2)
          expect(response.message).to eq('Foram encontrados 2 registros para o CPF ou email informado!')
          expect(response.cpf).to eq(cpf)
          expect(response.accounts.size).to eq(2)
        end
      end
    end

    context 'when no customer is found' do
      it 'must return not found message' do
        VCR.use_cassette('search_account_return_not_found') do
          response = client.search_account_by_cpf '07800000000'
          expect(response.code).to eq(3)
          expect(response.message).to eq('Nenhum registro foi encontrado para o CPF ou email informado!')
          expect(response.cpf).to eq('07800000000')
          expect(response.accounts).to be_empty
        end
      end
    end
  end
end
