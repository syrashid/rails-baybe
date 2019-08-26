class AddTotalPriceCentsAndPaymentToCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :total_price
    add_monetize :carts, :total_price, currency: { present: false }
    add_column :carts, :payment, :jsonb
  end
end
