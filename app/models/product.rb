class Product < ApplicationRecord
  belongs_to :user
  #has_many :orders
  has_many :product_restrictions, dependent: :destroy
  has_many :restrictions, through: :product_restrictions
  has_many :cart_items, dependent: :destroy

  has_one_attached :photo
  accepts_nested_attributes_for :restrictions

  validates :name, :price, :description, presence: true
end
