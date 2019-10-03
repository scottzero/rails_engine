require 'rails_helper'

RSpec.describe "Calling invoices api" do

  it "gets all invoices" do
    create_list(:invoice, 100)

    get '/api/v1/invoices'

    invoices = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(invoices.count).to eq(100)
  end

  it "gets a single invoice by id" do
    id = create(:invoice).id

    get "/api/v1/invoices/#{id}"

    expect(response).to be_successful
    invoice = JSON.parse(response.body)["data"]
    expect(invoice["id"].to_i).to eq(id)
  end

  context "test single finders" do
     it "returns single invoice, search is based on primary key" do
       invoice_1 = create(:invoice).id
       invoice_2 = create(:invoice).id

       get "/api/v1/invoices/find?id=#{invoice_1}"

       invoice = JSON.parse(response.body)["data"]

       expect(response).to be_successful
       expect(invoice["id"]).to eq(invoice_1.to_s)
       expect(invoice["id"]).to_not eq(invoice_2.to_s)
     end
   end
end
