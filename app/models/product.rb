class Product < ApplicationRecord
  belongs_to :user
  has_many :restrictions
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
end
