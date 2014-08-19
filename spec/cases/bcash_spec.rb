require 'spec_helper'

describe Bcash do
  before(:each) do
    Bcash.email = nil
    Bcash.token = nil
    Bcash.key = nil
  end

  let(:email) { 'joao@vendedor.com.br' }
  let(:token) { 'myhashtoken' }
  let(:key) { 'mylittlekey' }

  it 'should be able to set token and email' do
    Bcash.email = email
    Bcash.token = token

    expect(Bcash.email).to eq(email)
    expect(Bcash.token).to eq(token)
  end

  it 'should be able to set consumer key for oauth authentication' do
    Bcash.key = key
    expect(Bcash.key).to eq(key)
  end

  it 'should be able to pass all configuration via a configure block' do
    Bcash.configure do |config|
      config.email = email
      config.token = token
      config.key = key
    end

    expect(Bcash.email).to eq(email)
    expect(Bcash.token).to eq(token)
    expect(Bcash.key).to eq(key)
  end
end
