class Api::V1::ItemsController < ApplicationController
  def index
    render json: ItemSerializer.new(Item.where(item_params))
  end

  def show
    render json: ItemSerializer.new(Item.find(params[:id]))
  end
  private

  def item_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

end
