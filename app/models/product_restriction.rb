class ProductRestriction < ApplicationRecord
  belongs_to :restriction
  belongs_to :product
end
