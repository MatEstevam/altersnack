class Product < ApplicationRecord
  belongs_to :user
  has_many :restrictions

  validates :name, presence: true
  validates :price, presence: true
end
