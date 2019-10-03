require 'rails_helper'

RSpec.describe "Calling Transactions api"  do

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

  context "test single finders" do
     it "returns single transaction, search is based on primary key" do
       transaction_1 = create(:transaction).id
       transaction_2 = create(:transaction).id

       get "/api/v1/transactions/find?id=#{transaction_1}"

       transaction = JSON.parse(response.body)["data"]

       expect(response).to be_successful
       expect(transaction["id"]).to eq(transaction_1.to_s)
       expect(transaction["id"]).to_not eq(transaction_2.to_s)
     end
   end
end
