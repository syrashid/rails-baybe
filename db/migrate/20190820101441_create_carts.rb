class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total_price
      t.string :paid
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
