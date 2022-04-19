class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    if @new_expense.save!
      redirect_to home_page_expenses_path, flash: { alert: 'Your category is saved' }
    else
      redirect_to new_home_page_expense_path, flash: { alert: 'Could not save your category' }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
