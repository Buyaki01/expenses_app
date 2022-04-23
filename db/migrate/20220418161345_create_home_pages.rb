class CreateHomePages < ActiveRecord::Migration[7.0]
  def change
    create_table :home_pages do |t|
      t.references :author, foreign_key: { to_table: 'users' }, index: true
      t.string :name
      
      t.timestamps
    end
  end
end
