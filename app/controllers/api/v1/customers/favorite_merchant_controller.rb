class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    customer = Customer.find(params[:id])
    render json: MerchantSerializer.new(customer.fave_merch)
  end
end
