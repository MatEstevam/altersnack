class ProductRestriction < ApplicationRecord
  belongs_to :restrictions
  belongs_to :product
end
