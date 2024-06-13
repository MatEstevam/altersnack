class Product < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items

  has_one_attached :photo

  validates :name, :price, :description, presence: true
end
