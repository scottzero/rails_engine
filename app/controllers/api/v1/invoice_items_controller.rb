class Api::V1::InvoiceItemsController < ApplicationController
  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
  end

  private

  def invoice_item_params
    params.permit(:id, :quantity, :unit_price, :item_id, :invoice_id, :created_at, :updated_at)
  end
end
