class Product < ApplicationRecord
  belongs_to :user
  has_many :product_restrictions
  has_many :restrictions, through: :product_restrictions
  has_many_attached :photos

  validates :name, presence: true
  validates :price, presence: true
end
