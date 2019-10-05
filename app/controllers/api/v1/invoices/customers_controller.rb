class Api::V1::Invoices::CustomersController < ApplicationController

  def index
    render json: CustomerSerializer.new(Invoice.find(params[:id]).customer)
  end
end
