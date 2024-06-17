class AddPhotoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :photo, :jsonb
  end
end
