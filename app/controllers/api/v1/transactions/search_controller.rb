class Api::V1::Transactions::SearchController < ApplicationController

  def show
    render json: TransactionSerializer.new(Transaction.find_by(transaction_params))
  end

  def index
    render json: TransactionSerializer.new(Transaction.where(transaction_params))
  end

  private

  def transaction_params
    params.permit(:id, :credit_card_number, :result, :invoice_id, :created_at, :updated_at)
  end

end
