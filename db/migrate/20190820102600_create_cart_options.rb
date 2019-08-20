class CreateCartOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_options do |t|
      t.string :content
      t.references :option, foreign_key: true
      t.references :cart, foreign_key: true

      t.timestamps
    end
  end
end
