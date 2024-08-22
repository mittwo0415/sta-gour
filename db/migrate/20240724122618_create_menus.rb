class CreateMenus < ActiveRecord::Migration[6.1]
  def change
    create_table :menus do |t|
      t.references :shop, null: false, foreign_key: true
      t.string :name
      t.integer :price
      t.integer :category
      t.text :comment

      t.timestamps
    end
  end
end
