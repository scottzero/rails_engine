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
end
