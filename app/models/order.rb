class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart_item

  validates :user_id, :cart_item_id, :quantity, :price, presence: true

  def total_price
    price * quantity
  end
end
