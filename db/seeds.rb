Order.destroy_all
ProductRestriction.destroy_all
Product.destroy_all
Restriction.destroy_all
User.destroy_all


user1 = User.create!(
  name: "Healthy Eats",
  email: "healthyeats@example.com",
  password: "password",
  address: "123 Healthy St",
  restaurant: true
)

user2 = User.create!(
  name: "Organic Foods",
  email: "organicfoods@example.com",
  password: "password",
  address: "456 Organic Ave",
  restaurant: true
)

user3 = User.create!(
  name: "John Doe",
  email: "johndoe@example.com",
  password: "password",
  address: "789 Customer Rd",
  restaurant: false
)

gluten_free = Restriction.create!(name: "Gluten Free")
dairy_free = Restriction.create!(name: "Dairy Free")
nut_free = Restriction.create!(name: "Nut Free")

product1 = Product.create!(
  name: "Gluten Free Bread",
  price: 5.99,
  description: "Delicious gluten-free bread made with almond flour.",
  user: user1
)

product2 = Product.create!(
  name: "Organic Salad",
  price: 9.99,
  description: "Fresh organic salad with mixed greens and a lemon vinaigrette.",
  user: user2
)

product3 = Product.create!(
  name: "Dairy Free Yogurt",
  price: 3.99,
  description: "Creamy dairy-free yogurt made from coconut milk.",
  user: user1
)


ProductRestriction.create!(product: product1, restrictions_id: gluten_free.id)
ProductRestriction.create!(product: product2, restrictions_id: nut_free.id)
ProductRestriction.create!(product: product3, restrictions_id: dairy_free.id)


Order.create!(
  product: product1,
  user: user3
)

Order.create!(
  product: product2,
  user: user3
)


