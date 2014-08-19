require 'spec_helper'

describe Bcash do
  before(:each) do
    Bcash.email = nil
    Bcash.token = nil
    Bcash.secret = nil
  end

  let(:email) { 'joao@vendedor.com.br' }
  let(:token) { 'myhashtoken' }
  let(:secret) { 'mylittlesecret' }

  it 'should be able to set token and email' do
    Bcash.email = email
    Bcash.token = token

    expect(Bcash.email).to eq(email)
    expect(Bcash.token).to eq(token)
  end

  it 'should be able to set consumer secret for oauth authentication' do
    Bcash.secret = secret
    expect(Bcash.secret).to eq(secret)
  end

  it 'should be able to pass all configuration via a configure block' do
    Bcash.configure do |config|
      config.email = email
      config.token = token
      config.secret = secret
    end

    expect(Bcash.email).to eq(email)
    expect(Bcash.token).to eq(token)
    expect(Bcash.secret).to eq(secret)
  end
end
