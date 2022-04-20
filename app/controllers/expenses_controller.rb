class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all
    @category_details = HomePage.find(params[:home_page_id])
  end

  def new
    @expense = Expense.new
    @home_page_id = params[:home_page_id]
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    if @new_expense.save!
      redirect_to home_page_expenses_path(params[:home_page_id]), flash: { alert: 'Your expense is saved' }
    else
      redirect_to new_home_page_expense_path, flash: { alert: 'Could not save your expense' }
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
