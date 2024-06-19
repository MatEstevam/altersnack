class AddCartIdToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :cart_id, :bigint
  end
end
