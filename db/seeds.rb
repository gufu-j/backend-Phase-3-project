puts "🌱 Seeding spices..."
# Seed your database here
Bread.destroy_all
Bakery.destroy_all

bakery1 = Bakery.create(name: "Litella Bakery 101", location: "Westberry" )
bakery2 = Bakery.create(name: "Litella Bakery 102", location: "Bay Shore" )

Bread.create(name: "Bagel", type_of_bread: "Yeast bread", price: 2, bakery_id: bakery1.id)
Bread.create(name: "Baguette", type_of_bread: "Yeast bread", price: 3, bakery_id: bakery1.id)
Bread.create(name: "Banana bread", type_of_bread: "Quick bread", price: 4, bakery_id: bakery1.id)
Bread.create(name: "Melonpan", type_of_bread: "Sweet Crispy", price: 5, bakery_id: bakery2.id)


puts "✅ Done seeding!"