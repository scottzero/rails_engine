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


    context "test single finders" do
       it "returns single customer, search is based on primary key" do
         customer_1 = create(:customer).id
         customer_2 = create(:customer).id

         get "/api/v1/customers/find?id=#{customer_1}"

      customer = JSON.parse(response.body)["data"]

         expect(response).to be_successful
         expect(customer["id"]).to eq(customer_1.to_s)
         expect(customer["id"]).to_not eq(customer_2.to_s)
       end
     end
  end #end describe
