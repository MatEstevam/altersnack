class AddPhotoToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :photo, :jsonb
  end
end
