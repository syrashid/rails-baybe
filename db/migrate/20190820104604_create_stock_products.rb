class CreateStockProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_products do |t|
      t.string :color
      t.string :size
      t.references :condition, foreign_key: true
      t.references :cart, foreign_key: true
      t.references :product, foreign_key: true
      t.references :box, foreign_key: true

      t.timestamps
    end
  end
end
