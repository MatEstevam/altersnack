class AddPhotoToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :json
  end
end
