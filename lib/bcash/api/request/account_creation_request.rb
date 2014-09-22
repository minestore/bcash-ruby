module Bcash::Api
  class AccountCreationRequest < BaseRequest
    attr_accessor :owner, :legal_person, :address, :contact, :url, :transaction_mode

    alias_method :legalPerson, :legal_person
    alias_method :transactionMode, :transaction_mode

    validates_presence_of :owner, :address, :contact

    def initialize(attributes={})
      @address = AddressRequest.new(attributes.delete(:address))
      @owner = PersonRequest.new(attributes.delete(:owner))
      @contact = ContactRequest.new(attributes.delete(:contact))
    end

    def valid?
      super && owner.valid? && address.valid? && contact.valid? && legal_person_valid?
    end

    def legal_person_valid?
      legal_person.present? ? legal_person.valid? : true
    end

    def errors_full_messages
      errors.full_messages + address.errors.full_messages + owner.errors.full_messages +
        contact.errors.full_messages
    end

    def attributes
      { 'owner' => owner, 'legalPerson' => legal_person, 'address' => address, 'contact' => contact, 'url' => url, 'transactionMode' => transaction_mode }
    end
  end
end
