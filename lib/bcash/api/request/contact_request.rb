module Bcash::Api
  class ContactRequest < BaseRequest
    attr_accessor :phone_number, :mobile_phone_number, :commercial_phone_number

    alias_method :legalPerson, :legal_person
    alias_method :transcationMode, :transaction_mode

    validates_length_of :phone_number, :mobile_phone_number, :commercial_phone_number, max: 10

    validates_presence_of :phone_number, if: Proc.new { |c| c.mobile_phone_number.blank? && c.commercial_phone_number.blank? }
    validates_presence_of :mobile_phone_number, if: Proc.new { |c| c.phone_number.blank? && c.commercial_phone_number.blank? }
    validates_presence_of :commercial_phone_number, if: Proc.new { |c| c.phone_number.blank? && c.mobile_phone_number.blank? }
  end
end
