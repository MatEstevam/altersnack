class AddProductDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :product, foreign_key: true unless column_exists?(:orders, :product_id)
    add_column :orders, :price, :decimal, precision: 10, scale: 2, null: false, default: 0.0 unless column_exists?(:orders, :price)
  end
end
