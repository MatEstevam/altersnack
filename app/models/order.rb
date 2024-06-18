class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, :quantity, :price, presence: true
  monetize :amount_cents

  def total_price
    price * quantity
  end
end
