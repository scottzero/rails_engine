class InvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :status, :merchant_id, :customer_id
end
