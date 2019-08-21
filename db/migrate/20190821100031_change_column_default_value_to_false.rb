class ChangeColumnDefaultValueToFalse < ActiveRecord::Migration[5.2]
  def change
    change_column :stock_products, :purchased, :boolean, :default => false
  end
end
