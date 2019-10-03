require 'csv'
#need to create tables and model first :o !!!
  namespace :fetch do
  desc "import data from csv file"

  task customer: :environment do
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_hash)
    end #end task customer
  end #end foreach customer

  task merchant: :environment do
    CSV.foreach('./data/merchants.csv', headers:true) do |row|
      Merchant.create(row.to_hash)
    end
  end

  task item: :environment do
    CSV.foreach('./data/items.csv', headers:true) do |row|
      Item.create(row.to_hash)
    end
  end

  task invoice: :environment do
    CSV.foreach('./data/invoices.csv', headers:true) do |row|
      Invoice.create(row.to_hash)
    end
  end

  task transaction: :environment do
    CSV.foreach('./data/transactions.csv', headers:true) do |row|
      Transaction.create(row.to_hash)
    end
  end

  task invoice_item: :environment do
    CSV.foreach('./data/invoice_items.csv', headers:true) do |row|
      InvoiceItem.create(row.to_hash)
    end
  end

end #end namspace
