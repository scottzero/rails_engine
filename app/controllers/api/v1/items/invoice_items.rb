class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(Item.find(params[:id]).invoice_items)
  end
end
