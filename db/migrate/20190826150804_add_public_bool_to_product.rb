class AddPublicBoolToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :public, :boolean, default: false

  end
end
