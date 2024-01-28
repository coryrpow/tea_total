class SubscriptionSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :price, :frequency, :status
end
