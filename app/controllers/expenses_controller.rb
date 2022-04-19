class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end
  def new
    @expense = Expense.new
  end
end
