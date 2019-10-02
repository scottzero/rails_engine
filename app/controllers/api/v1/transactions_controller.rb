class Api::V1::TransactionsController < ApplicationController
  def index
    render json: TransactionSerializer.new(Transaction.where(transaction_params))
  end

  def show
    render json: TransactionSerializer.new(Transaction.find(params[:id]))
  end

  private

  def transaction_params
    params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
  end
end
