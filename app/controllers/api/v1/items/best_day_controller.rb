class Api::V1::Items::BestDayController < ApplicationController
  def show
    render json: ItemSerializer.new(Item.best_day(params[:id]))
    # render json: TimeDateSerializer.new(Item.best_day(params[:id]))???
  end
end
