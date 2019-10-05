class Api::V1::Merchants::ItemsController < ApplicationController
  def index
    # pry
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end
end
