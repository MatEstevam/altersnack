class AddPriceToProducts < ActiveRecord::Migration[7.1]
  def change
    add_monetize :carts, :price, currency: { present: false }
  end
end
