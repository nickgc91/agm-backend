# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Goal.destroy_all

User.create(username: "Elliot", password: '123456', email: "elliot@elliot.com", accountability_partner: 4)
User.create(username: "Harry", password: '123456', email: "Harry@Harry.com", accountability_partner: 1)
User.create(username: "Rod", password: '123456', email: "Rod@Rod.com", accountability_partner: 2)
User.create(username: "Adnan", password: '123456', email: "Adnan@Adnan.com", accountability_partner: 3)

Goal.create(title: "4 runs per week", completion_status: "30%", user_id: 2)
Goal.create(title: "travel to 6 new countries", completion_status: "70%", user_id: 4)
Goal.create(title: "meditate every day", completion_status: "80%", user_id: 2)
Goal.create(title: "set monthly budget and stick to it", completion_status: "10%", user_id: 1)
Goal.create(title: "eat salad for dinner 3 times a week", completion_status: "50%", user_id: 4)



