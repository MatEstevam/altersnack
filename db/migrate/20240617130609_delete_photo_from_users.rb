class DeletePhotoFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :photo, :json
  end
end
