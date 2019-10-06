class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    customer = Customer.find(params[:id])
    #need to convert first ID into an integer. the one under [data]
    #postman /customers/3/favoriter_merchant
    render json: FaveMerchantSerializer.new(customer.fave_merch)
  end
end
