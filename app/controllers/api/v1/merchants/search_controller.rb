class Api::V1::Merchants::SearchController < ApplicationController


  def index
    # pry
    render json: MerchantSerializer.new(Merchant.where(merchant_params))
  end

  def show
    render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
  end

  def random
    if merchant_params.empty?
    render json: MerchantSerializer.new(Merchant.all.sample)
    end
end


  private

   def merchant_params
     params.permit(:id, :name, :created_at, :updated_at)
   end

end
