class AddDeliveryFeeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :delivery_fee, :decimal
  end
end
