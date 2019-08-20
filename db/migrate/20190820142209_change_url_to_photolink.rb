class ChangeUrlToPhotolink < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :photolink
  end
end
