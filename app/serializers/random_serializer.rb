class RandomSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :unit_price, :merchant_id

  attribute :unit_price do |item|
   (item.unit_price / 100.0).to_s
  end
end
