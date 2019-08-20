class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :name
      t.float :sell_ratio
      t.float :buy_ratio

      t.timestamps
    end
  end
end
