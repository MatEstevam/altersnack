class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_many :product_restrictions, dependent: :destroy
  has_many :restrictions, through: :product_restrictions

  has_one_attached :photo

  validates :name, :price, :description, presence: true
end
