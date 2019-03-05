# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Item.destroy_all

20.times do 
	item = Item.create(title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry, price: Faker::Number.decimal(2), img_url: Faker::Internet.url('example.com'))
end



5.times do
	cart = Cart.create
	line_item = LineItem.create(quantity: 2, item_id: Item.all.sample.id, cart_id: Cart.all.sample.id)
end