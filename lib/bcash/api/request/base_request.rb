module Bcash::Api
  class BaseRequest
    include ActiveModel::Model
    include ActiveModel::Serialization
    include ActiveModel::Serializers::JSON
  end
end
