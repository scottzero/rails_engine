class Api::V1::Customers::SearchController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.find_by(customer_params))
  end

  def index
    render json: CustomerSerializer.new(Customer.where(customer_params))
  end


  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

end
