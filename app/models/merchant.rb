class Merchant < ApplicationRecord
has_many :invoices
has_many :items
validates_presence_of :name


def self.most_revenue(x)
  select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price)AS revenue")
  .joins(invoices: [:invoice_items, :transactions])
  .where(transactions: {result: "success"})
  .group(:id)
  .order("revenue DESC")
  .limit(x)
end

end
