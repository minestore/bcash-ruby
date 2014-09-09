module Bcash::Api
  class ContactRequest < BaseRequest
    attr_accessor :phone_number, :mobile_phone_number, :commercial_phone_number

    alias_method :phoneNumber, :phone_number
    alias_method :mobilePhoneNumber, :mobile_phone_number
    alias_method :commercialPhoneNumber, :commercial_phone_number

    validates_length_of :phone_number, :mobile_phone_number, :commercial_phone_number, maximum: 12

    validates_presence_of :phone_number, if: Proc.new { |c| c.mobile_phone_number.blank? && c.commercial_phone_number.blank? }
    validates_presence_of :mobile_phone_number, if: Proc.new { |c| c.phone_number.blank? && c.commercial_phone_number.blank? }
    validates_presence_of :commercial_phone_number, if: Proc.new { |c| c.phone_number.blank? && c.mobile_phone_number.blank? }

    def attributes
      { 'phoneNumber' => phone_number, 'mobilePhoneNumber' => mobile_phone_number, 'commercialPhoneNumber' => commercial_phone_number }
    end
  end
end
