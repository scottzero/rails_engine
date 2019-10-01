require 'csv'
#need to create tables first
namespace :import do
  desc "import data from csv file"
  task customer: :environment do
    CSV.foreach('./data/customers.csv', headers: true) do |row|
      Customer.create(row.to_hash)
    end
  end
end
