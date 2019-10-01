class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where(item_params))
  end


  private

  def item_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
