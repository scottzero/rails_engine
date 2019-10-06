class Customer < ApplicationRecord
has_many :invoices
has_many :merchants, through: :invoices
has_many :transactions, through: :invoices
validates_presence_of :first_name, :last_name



def fave_merch
  merchants.joins(invoices: :transactions)
  .where(transactions: {result: "success"})
  .group(:id)
  .order("COUNT(transactions.id)").limit(1)
end

end
