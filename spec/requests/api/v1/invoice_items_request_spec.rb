require 'rails_helper'

RSpec.describe "calling invoices items api" do

  it "gets a list of all invoices" do
    create_list(:invoice_item,5)
    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]

    expect(invoice_items.count).to eq(5)
  end

  it "gets an invoice item by id" do
    id = create(:invoice_item).id
    get "/api/v1/invoice_items/#{id}"

    expect(response).to be_successful
    invoice_items = JSON.parse(response.body)["data"]
    expect(invoice_items["id"].to_i).to eq(id)
  end

  context "test single finders" do
     it "returns single invoice item, search is based on primary key" do
       invoice_item_1 = create(:invoice_item).id
       invoice_item_2 = create(:invoice_item).id

       get "/api/v1/invoice_items/find?id=#{invoice_item_1}"

       invoice_item = JSON.parse(response.body)["data"]

       expect(response).to be_successful
       expect(invoice_item["id"]).to eq(invoice_item_1.to_s)
       expect(invoice_item["id"]).to_not eq(invoice_item_2.to_s)
     end
   end
end
