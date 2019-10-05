class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    #need to identify customer FIRST,  instead of nested function
    customer = Customer.find[params[:id]]
    pry
    render json: TransactionSerializer.new(customer.transactions)
  end
end
