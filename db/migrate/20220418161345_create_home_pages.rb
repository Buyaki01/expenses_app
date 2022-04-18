class CreateHomePages < ActiveRecord::Migration[7.0]
  def change
    create_table :home_pages do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
