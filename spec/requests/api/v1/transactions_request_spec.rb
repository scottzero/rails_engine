require 'rails_helper'

RSpec.describe "Calling Transactions api"  do

  describe "GET #index" do
    it "returns http success" do
      get '/api/v1/transactions'
      expect(response).to have_http_status(:success)
    end
  end

end
