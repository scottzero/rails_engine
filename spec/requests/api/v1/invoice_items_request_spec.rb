require 'rails_helper'

RSpec.describe "calling invoices items api" do

  describe "GET #index" do
    it "returns http success" do
      get '/api/v1/items'
      expect(response).to have_http_status(:success)
    end
  end

end
