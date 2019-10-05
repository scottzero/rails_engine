class Api::V1::Merchants::SearchController < ApplicationController


  def index
    # pry
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  def show
    if merchant_params.empty?
      render json: MerchantRandomSerializer.new(Merchant.order('RANDOM()').first)
    else
      render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
    end
  end

  private

   def merchant_params
     params.permit(:id, :name, :created_at, :updated_at)
   end

end
