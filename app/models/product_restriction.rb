class ProductRestriction < ApplicationRecord
  belongs_to :restriction, foreign_key: 'restrictions_id'
  belongs_to :product
end
