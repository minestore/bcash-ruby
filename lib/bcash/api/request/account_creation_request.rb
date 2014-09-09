module Bcash::Api
  class AccountCreationRequest < BaseRequest
    attr_accessor :owner, :legal_person, :address, :contact, :url, :transactionMode

    alias_method :legalPerson, :legal_person
    alias_method :transactionMode, :transaction_mode

    validates_presence_of :owner, :address, :contact
  end
end
