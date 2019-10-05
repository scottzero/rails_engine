require 'rails_helper'

RSpec.describe "Transactions API can do..."  do

  it "gets all transactions" do
    create_list(:transaction, 9)

    get '/api/v1/transactions'

    transactions= JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(transactions.count).to eq(9)
  end

  it "gets a single transaction by id" do
    id = create(:transaction).id

    get "/api/v1/transactions/#{id}"

    expect(response).to be_successful
    transaction = JSON.parse(response.body)["data"]
    expect(transaction["id"].to_i).to eq(id)
  end

  context "Invoices relationship..." do
     it "gets the invoice for a transaction" do
       invoice = create(:invoice)
       transaction = create(:transaction, invoice: invoice)
       get "/api/v1/transactions/#{transaction.id}/invoice"
       expect(response).to be_successful
       transaction_invoice = JSON.parse(response.body)["data"]
       expect(transaction_invoice["id"].to_i).to eq(invoice.id)
     end
   end
end
