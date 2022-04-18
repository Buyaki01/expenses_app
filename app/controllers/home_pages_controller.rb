class HomePagesController < ApplicationController
  def index; end

  def new
    @home_page = HomePage.new
  end

  def create
    @new_category = current_user.home_pages.new(category_params)
    if @new_category.save!
      redirect_to home_pages_path, flash: { alert: 'Your category is saved' }
    else
      redirect_to new_home_page_path, flash: { alert: 'Could not save your category' }
    end
  end

  private

  def category_params
    params.require(:home_page).permit(:name, :icon)
  end
end
