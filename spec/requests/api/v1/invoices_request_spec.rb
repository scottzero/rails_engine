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
end
