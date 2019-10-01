require "rails_helper"

RSpec.describe "Calling Merchant API" do
      it "gets all merchants"do
        create_list(:merchant, 9)

        get '/api/v1/merchants'

        # binding.pry
        merchants = JSON.parse(response.body)
        expect(response).to be_successful
        expect(merchants.count).to eq(9)
      end
    end
