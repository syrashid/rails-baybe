class AddInCartToStockProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :stock_products, :purchased, :boolean, default: :true
  end
end
