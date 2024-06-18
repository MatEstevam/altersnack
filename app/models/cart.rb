class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_many :orders, dependent: :destroy
  monetize :price_cents

  def total_price
    cart_items.includes(:product).reduce(0) { |sum, item| sum + item.total_price }
  end
end
