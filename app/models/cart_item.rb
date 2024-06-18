class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  has_many :orders, dependent: :destroy

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_default_quantity, on: :create

  def total_price
    product.price * quantity
  end

  private

  def set_default_quantity
    self.quantity ||= 0
  end
end
