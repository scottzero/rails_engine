require 'rails_helper'

RSpec.describe "calling items API" do

  it "gets all items" do
    create_list(:item, 3)

    get '/api/v1/items'

    items = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(items.count).to eq(3)
  end

  it "gets a single item by id" do
    id = create(:item).id

    get "/api/v1/items/#{id}"

    expect(response).to be_successful
    item = JSON.parse(response.body)["data"]
    expect(item["id"].to_i).to eq(id)
  end
end
