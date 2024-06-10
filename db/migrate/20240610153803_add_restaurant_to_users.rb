class AddRestaurantToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :restaurant, :boolean
  end
end
