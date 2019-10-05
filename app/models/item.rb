class Item < ApplicationRecord
belongs_to :merchant
has_many :invoice_items
has_many :invoices, through: :invoice_items
validates_presence_of :name, :description, :unit_price


  def self.most_revenue(x)
    select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .joins(invoices: :transactions)
    .where(transactions: {result: "success"})
    .group(:id)
    .order("revenue DESC")
    .limit(x)
  end
end
