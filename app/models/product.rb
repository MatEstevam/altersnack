class Product < ApplicationRecord
  belongs_to :user
  has_many :product_restrictions
  has_many :restrictions, through: :product_restrictions
  has_one_attached :photo
  accepts_nested_attributes_for :restrictions

  validates :name, presence: true
  validates :price, presence: true
end
