class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Invoice.find(params[:id]).transactions)
  end
end
