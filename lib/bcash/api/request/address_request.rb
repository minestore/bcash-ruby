module Bcash::Api
  class AddressRequest
    include ActiveModel::Model
    include ActiveModel::Serialization
    include ActiveModel::Serializers::JSON

    attr_accessor :address, :number, :complement, :neighborhood, :city, :state, :zip_code

    validates_presence_of :address, :number, :city, :state, :zip_code
    validates_length_of :state, is: 2
    validates_length_of :zip_code, in: 8..9

    def zipCode
      zip_code
    end

    def attributes
      { 'address' => address, 'number' => number, 'complement' => complement, 'neighborhood' => neighborhood, 'city' => city, 'state' => state, 'zipCode' => zip_code }
    end
  end
end
