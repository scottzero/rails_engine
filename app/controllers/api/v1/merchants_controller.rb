# app/controllers/api/v1/merchants_controller.rb
class Api::V1::MerchantsController < ApplicationController
  def index
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
