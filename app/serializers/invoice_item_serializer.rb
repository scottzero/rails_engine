class InvoiceItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :quantity, :unit_price, :item_id, :invoice_id

  attribute :unit_price do |invoice_item|
    invoice_item.unit_price = (invoice_item.unit_price.to_f/100).to_s
  end

end
