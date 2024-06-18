class AddCartItemToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :cart, foreign_key: true
    remove_reference :orders, :product, foreign_key: true
  end
end
