class ExpensesController < ApplicationController
  def index
    @category_details = HomePage.find(params[:home_page_id])
    @expenses = []
    @total_amount = 0
    @category_details.expenses_categories.order(created_at: :desc).each do |expenses_category|
      @expenses.push(expenses_category.expense)
      @total_amount += expenses_category.expense.amount
    end
  end

  def new
    @expense = Expense.new
    @home_page_id = params[:home_page_id]
  end

  def create
    @new_expense = current_user.expenses.new(expense_params)
    if @new_expense.save!
      ExpensesCategory.create(home_page_id: params[:home_page_id], expense_id: @new_expense.id)
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
