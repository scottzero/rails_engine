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

  def self.best_day
    invoices.select("invoices.created_at AS best_day, SUM(invoice_items.quantity) AS sum_amt_sold")
    .joins(:transactions)
    .where(transactions: {result: "success"})
    .group(:created_at)
    .order("sum_amt_sold DESC, best_day DESC") #default DESC
    .limit(1)
  end

end
