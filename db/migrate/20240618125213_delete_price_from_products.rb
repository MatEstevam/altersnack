class DeletePriceFromProducts < ActiveRecord::Migration[7.1]
  def change
    remove_column :products, :price, :float
  end
end
