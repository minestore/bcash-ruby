module Bcash::Api
  class AccountNotValidResponse < Response
    attr_accessor :account

    def initialize(account)
      self.success = false
      self.account = account
    end

    def message
      @account.errors_full_messages
    end
  end
end
