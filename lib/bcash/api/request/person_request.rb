module Bcash::Api
  class PersonRequest < BaseRequest
    attr_accessor :email, :gender, :name, :cpf, :rg, :birth_date

    alias_method :birthDate, :birth_date

    validates_presence_of :email, :gender, :name, :cpf

    def attributes
      { 'email' => email, 'gender' => gender, 'name' => name, 'cpf' => cpf, 'rg' => rg, 'birthDate' => birth_date }
    end
  end
end
