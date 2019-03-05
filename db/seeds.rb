# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Item.destroy_all
Cart.destroy_all
Order.destroy_all
LineItem.destroy_all

20.times do
	user = User.create(email: 'john@gmail.com', password: 'topsecret', password_confirmation: 'topsecret')
	item = Item.create(title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.registry, price: Faker::Number.decimal(2), img_url: Faker::Internet.url('example.com'))
end



10.times do
	cart = Cart.create(user_id: User.all.sample.id)
	order = Order.create(name: Faker::Artist.name, email: Faker::Internet.email, address: Faker::Address.full_address, pay_method: Faker::Artist.name)
	line_item = LineItem.create(quantity: 2, item_id: Item.all.sample.id, cart_id: Cart.all.sample.id, order_id: Order.all.sample.id)
end