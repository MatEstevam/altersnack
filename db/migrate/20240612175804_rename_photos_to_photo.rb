class RenamePhotosToPhoto < ActiveRecord::Migration[7.1]
  def change
    rename_column :products, :photos, :photo
  end
end
