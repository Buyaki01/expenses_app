class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end
end
