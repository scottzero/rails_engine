# app/controllers/api/v1/merchants_controller.rb
class Api::V1::MerchantsController < ApplicationController
  def index
    render json: Merchant.all
  end

end
