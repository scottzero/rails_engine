class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    #off by 1 in the spec harness and I dont know why, fix later
    transaction = Transaction.find(params[:id])
    # pry
    render json: InvoiceSerializer.new(transaction.invoice)

  end
end
