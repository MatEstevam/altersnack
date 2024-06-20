class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart

  validates :user_id, :quantity, presence: true
  monetize :amount_cents

  def total_price
    price * quantity
  end
end
