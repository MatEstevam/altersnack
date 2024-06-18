# Limpar o banco de dados
Order.destroy_all
ProductRestriction.destroy_all
Product.destroy_all
Restriction.destroy_all
User.destroy_all

require 'faker'

# Criar restrições
Restriction.create!(name: "Gluten Free")
Restriction.create!(name: "Dairy Free")
Restriction.create!(name: "Nut Free")
Restriction.create!(name: "Soy Free")
Restriction.create!(name: "Vegetarian")
Restriction.create!(name: "Vegan")

# Criar 20 restaurantes e produtos com restrições aleatórias
20.times do |i|
  user = User.create!(
    name: Faker::Restaurant.name,
    email: Faker::Internet.email,
    password: "password",
    address: Faker::Address.street_address,
    restaurant: true
  )

  puts "user #{i} created"

  3.times do |j|
    product = Product.create!(
      name: Faker::Food.dish,
      price: Faker::Number.decimal(l_digits: 2),
      description: Faker::Food.description,
      user: user
    )
    # Associar restrições de forma aleatória aos produtos
    random_restrictions = Restriction.order("RANDOM()").limit(rand(1..2))
    random_restrictions.each do |restriction|
      ProductRestriction.create!(product: product, restriction: restriction)
    end
  end
end

puts "Seed completo!"
