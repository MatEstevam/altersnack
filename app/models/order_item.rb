class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, :price, presence: true

  def total_price
    price * quantity
  end
end
