class Api::V1::Merchants::InvoicesController < ApplicationController


  def index
    # pry
    render json: InvoiceSerializer.new(Merchant.find(params[:id]).invoices)
  end
end
