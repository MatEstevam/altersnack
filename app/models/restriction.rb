class Restriction < ApplicationRecord
  has_many :product_restrictions, dependent: :destroy
  has_many :products, through: :product_restrictions

  validates :name, presence: true
end
