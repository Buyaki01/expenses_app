class CreateExpensesCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses_categories do |t|
      t.references :expenses, null: false, foreign_key: {to_table: 'expenses'}, index: true
      t.references :home_pages, null: false, foreign_key: {to_table: 'home_pages'}, index: true
      t.timestamps
    end
  end
end
