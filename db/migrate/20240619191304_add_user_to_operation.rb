class AddUserToOperation < ActiveRecord::Migration[7.1]
  def change
    add_reference :recipes, :user, null: false, foreign_key: true
    remove_column :recipes, :favorited, :boolean
  end
end
