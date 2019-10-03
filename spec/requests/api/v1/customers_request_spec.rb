require 'rails_helper'

RSpec.describe "calling customers request api" do

    it "gets a list of all customers" do
      create_list(:customer,3) #creating 3 customers
      get '/api/v1/customers'

      expect(response).to be_successful

      customers = JSON.parse(response.body)["data"]

      expect(customers.count).to eq(3)
    end

    it "gets a customer by id" do
      id = create(:customer).id
      get "/api/v1/customers/#{id}"

      expect(response).to be_successful
      customer = JSON.parse(response.body)["data"]
      expect(customer["id"].to_i).to eq(id)
    end
  end #end describe
