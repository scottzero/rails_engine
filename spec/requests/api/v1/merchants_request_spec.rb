require "rails_helper"

RSpec.describe "Calling Merchant API" do
  it "gets all merchants" do
    create_list(:merchant, 9)

    get '/api/v1/merchants'

    merchants = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(merchants.count).to eq(9)
  end

  it "gets a single merchant by id" do
    id = create(:merchant).id

    get "/api/v1/merchants/#{id}"

    expect(response).to be_successful
    merchant = JSON.parse(response.body)["data"]
    expect(merchant["id"].to_i).to eq(id)
  end

  context "test single finders" do
     it "returns single merchant, search is based on primary key" do
       merchant_1 = create(:merchant).id
       merchant_2 = create(:merchant).id
       get "/api/v1/merchants/find?id=#{merchant_1}"
       merchant = JSON.parse(response.body)["data"]
       expect(response).to be_successful
       expect(merchant["id"]).to eq(merchant_1.to_s)
       expect(merchant["id"]).to_not eq(merchant_2.to_s)
     end

     it "returns a single merchant by name" do
      merchant_1 = create(:merchant, name: "scott")
      merchant_2 = create(:merchant, name: "bob")
      get "/api/v1/merchants/find?name=#{merchant_1.name}"
      merchant = JSON.parse(response.body)["data"]
      expect(response).to be_successful
      expect(merchant["attributes"]["name"]).to eq(merchant_1.name)
      expect(merchant["attributes"]["name"]).to_not eq(merchant_2.name)
      get "/api/v1/merchants/find?name=#{merchant_2.name}"
      merchant = JSON.parse(response.body)["data"]
      expect(response).to be_successful
      expect(merchant["attributes"]["name"]).to eq(merchant_2.name)
      expect(merchant["attributes"]["name"]).to_not eq(merchant_1.name)
    end

    it "finds a single merchant by created_at time stamp" do
      merchant_1 = create(:merchant, created_at: "1999-01-03T10:10:10.000Z")
      get "/api/v1/merchants/find?created_at=#{merchant_1.created_at}"
      expect(response).to be_successful
      merchant = JSON.parse(response.body)["data"]
      # binding.pry
      expect(merchant["id"].to_i).to eq(merchant_1.id)
   end

   it "finds a single merchant by updated_at time stamp" do
     merchant_1 = create(:merchant, created_at: "1999-01-03T10:10:10.000Z",updated_at: "1999-01-03T11:11:11.000Z")
     get "/api/v1/merchants/find?updated_at=#{merchant_1.updated_at}"
     expect(response).to be_successful
     merchant = JSON.parse(response.body)["data"]
     # binding.pry
     expect(merchant["id"].to_i).to eq(merchant_1.id)
  end
end
#BEGIN MULTI FINDERS !!!!!!!
  context "multi-finders" do
    it "gets all merchants by merchant ID" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

   get "/api/v1/merchants/find_all?id=#{merchant_1.id}"
   expect(response).to be_successful
   merchant = JSON.parse(response.body)["data"]
   expect(merchant[0]["id"].to_i).to eq(merchant_1.id)
   get "/api/v1/merchants/find_all?id=#{merchant_2.id}"
   expect(response).to be_successful
   merchant = JSON.parse(response.body)["data"]
   expect(merchant[0]["id"].to_i).to eq(merchant_2.id)
end
end

  context "random finders" do
    it "finds a random Merchant" do
    create_list(:merchant, 10)

    ids = Merchant.pluck(:id)

    get "/api/v1/merchants/random"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)["data"]
    # binding.pry
    expect(ids).to include(merchant["id"].to_i)
  end
  end

  context "relationship endpoints" do
    it "can get all items for a single merchant" do
      merchant = create(:merchant)
      item_1 = create(:item, merchant: merchant)
      item_2 = create(:item, merchant: merchant)
      item_3 = create(:item, merchant: merchant)
      get "/api/v1/merchants/#{merchant.id}/items"
      expect(response).to be_successful
      merchant_items = JSON.parse(response.body)["data"]
      expect(merchant_items[0]["id"].to_i).to eq(item_1.id)
      expect(merchant_items[1]["id"].to_i).to eq(item_2.id)
      expect(merchant_items[2]["id"].to_i).to eq(item_3.id)
    end

    it "can get all invoices for a single merchant" do
      merchant = create(:merchant)
      item_1 = create(:invoice, merchant: merchant)
      item_2 = create(:invoice, merchant: merchant)
      item_3 = create(:invoice, merchant: merchant)
      get "/api/v1/merchants/#{merchant.id}/invoices"
      expect(response).to be_successful
      merchant_invoices = JSON.parse(response.body)["data"]
      expect(merchant_invoices[0]["id"].to_i).to eq(item_1.id)
      expect(merchant_invoices[1]["id"].to_i).to eq(item_2.id)
      expect(merchant_invoices[2]["id"].to_i).to eq(item_3.id)
    end
end

    
end
