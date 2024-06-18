class DeletePhotoFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :photo, :jsonb
  end
end
