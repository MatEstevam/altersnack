class Restaurant < User
  has_many :products, foreign_key: 'user_id'
end

