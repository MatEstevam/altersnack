class AddQuantityToOrders < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:orders, :quantity)
      add_column :orders, :quantity, :integer, default: 1, null: false
    end
  end
end
