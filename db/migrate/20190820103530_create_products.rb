class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :gender
      t.integer :age_min
      t.integer :age_max
      t.string :brand
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
