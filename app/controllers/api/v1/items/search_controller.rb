class Api::V1::Items::SearchController < ApplicationController

  def show
    if item_params.empty?
  #     #works in post man but every data object rendered comes back with params
  #     #so test wont pass here.
      render json: RandomSerializer.new(Item.order('RANDOM()').first)
  else
    render json: ItemSerializer.new(Item.find_by(item_params))
  end
  end

  def index
    render json: ItemSerializer.new(Item.where(item_params))
  end


  private

  def item_params
    params.permit(:id, :name, :unit_price, :description, :created_at, :updated_at)
  end

end
