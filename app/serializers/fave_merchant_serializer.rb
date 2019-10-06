class FaveMerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name

  attribute :id do |merch|
  merch.id.to_i
  end
end
