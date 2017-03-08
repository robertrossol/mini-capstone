# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product_list = [
  # [ "Mario Galaxy", 20, "http://www.mariogalaxy.com", "Galactic, 3D platformer with near perfect reviews" ],
  # [ "Bioshock", 15, "http://www.bioshock.com", "Dystopian survival horror game in the undersea city of Rapture" ],
  # [ "Borderlands", 15, "http://www.borderlands.com", "post apocalytpic, off world co-op shooter RPG hybrid" ],
  #[Faker::Name.name, 15, "http://www.borderlands.com", "post apocalytpic, off world co-op shooter RPG hybrid" ]
]

# product_list.each do |product|
#   Product.create( :name => product[0], :price => product[1], :image => product[2], :description => product[3])
# end

5.times do
  Product.create( :name => Faker::Name.name, :price => Faker::Number.number(2), :image => Faker::Placeholdit.image, :description => Faker::Friends.quote)
end