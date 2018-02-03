class FinancialTransactionsController < ApplicationController
  def index
    render locals: {
      transactions: FinancialTransaction.all
    }
  end
end
