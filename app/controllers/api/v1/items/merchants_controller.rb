class Api::V1::Items::MerchantsController < ApplicationController


  def index
    render json: Merchant.new(Item.find(params[:id]).merchant)
  end
end
