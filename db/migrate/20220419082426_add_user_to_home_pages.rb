class AddUserToHomePages < ActiveRecord::Migration[7.0]
  def change
    add_reference :home_pages, :user, null: false, foreign_key: true
  end
end
