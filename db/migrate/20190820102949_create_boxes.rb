class CreateBoxes < ActiveRecord::Migration[5.2]
  def change
    create_table :boxes do |t|
      t.decimal :expected_price
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
