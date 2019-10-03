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
end
