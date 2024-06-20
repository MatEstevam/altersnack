class DeletePriceFromOrders < ActiveRecord::Migration[7.1]
  def change
    remove_column :orders, :price, :decimal
  end
end
