class Api::V1::InvoicesController < ApplicationController
  def index
    render json: InvoiceSerializer.new(Invoice.where(invoice_params))
  end

  def show
    render json: Invoice.new(Invoice.find(params[:id]))
  end

  private

  def invoice_params
    params.permit(:id, :status, :merchant_id, :customer_id, :created_at, :updated_at)
  end

end
