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

  context "test single finders" do
     it "returns single item, search is based on primary key" do
       item_1 = create(:item).id
       item_2 = create(:item).id

       get "/api/v1/items/find?id=#{item_1}"

       item = JSON.parse(response.body)["data"]

       expect(response).to be_successful
       expect(item["id"]).to eq(item_1.to_s)
       expect(item["id"]).to_not eq(item_2.to_s)
     end
   end

   it "returns a single item by name" do
    item_1 = create(:item, name: "xbox")
    item_2 = create(:item, name: "pc")

    get "/api/v1/items/find?name=#{item_1.name}"
    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["name"]).to eq(item_1.name)
    expect(item["attributes"]["name"]).to_not eq(item_2.name)
    get "/api/v1/items/find?name=#{item_2.name}"
    item = JSON.parse(response.body)["data"]
    expect(response).to be_successful
    expect(item["attributes"]["name"]).to eq(item_2.name)
    expect(item["attributes"]["name"]).to_not eq(item_1.name)
  end
end
