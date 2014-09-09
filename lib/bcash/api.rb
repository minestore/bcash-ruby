module Bcash::Api
  autoload :Accounts, 'bcash/api/accounts'
  autoload :Response, 'bcash/api/response'
  autoload :AccountResponse, 'bcash/api/account_response'

  autoload :BaseRequest, 'bcash/api/request/base_request'
  autoload :AddressRequest, 'bcash/api/request/address_request'
  autoload :AccountCreationRequest, 'bcash/api/request/account_creation_request'
  autoload :ContactRequest, 'bcash/api/request/contact_request'
  autoload :PersonRequest, 'bcash/api/request/person_request'
end
