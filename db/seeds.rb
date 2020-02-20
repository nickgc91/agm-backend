# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Goal.destroy_all
ActionItem.destroy_all
Journaling.destroy_all
LifeStatusTracker.destroy_all

User.create(username: "Nick", password: '123456', email: "nick@nick.com", accountability_partner: 3)
User.create(username: "Imran", password: '123456', email: "martin@martin.com", accountability_partner: 4)
User.create(username: "Conrad", password: '123456', email: "Harry@Harry.com", accountability_partner: 1)
User.create(username: "Yann", password: '123456', email: "Rod@Rod.com", accountability_partner: 2)
User.create(username: "Vinny", password: '123456', email: "Adnan@Adnan.com", accountability_partner: 3)



Goal.create(title: "Set a monthly budget and stick to it", completion_status: "10%", user_id: 1)
ActionItem.create(action: "Download Monzo app.", isCompleted: false, goal_id: 1)
ActionItem.create(action: "Break down the monthly budget into weekly and daily budget and keep track.", isCompleted: true, goal_id: 1)
ActionItem.create(action: "Find accountability partner to help me manage this goal.", isCompleted: false, goal_id: 1)

Goal.create(title: "Do 4 runs per week", completion_status: "30%", user_id: 2)
ActionItem.create(action: "Buy new running shoes.", isCompleted: false, goal_id: 2)
ActionItem.create(action: "Clear my schedule Mondays and Wendesdays.", isCompleted: true, goal_id: 2)
ActionItem.create(action: "Start with a 20min run on Mondays 4 weeks in a row", isCompleted: false, goal_id: 2)

Goal.create(title: "Meditate every day", completion_status: "80%", user_id: 2)
ActionItem.create(action: "Find a quiet space to medidate.", isCompleted: false, goal_id: 3)
ActionItem.create(action: "Download Headspace and buy membership.", isCompleted: true, goal_id: 3)
ActionItem.create(action: "Keep a log of my sessions. How they went. How long and when I meditated.", isCompleted: false, goal_id: 3)


Goal.create(title: "Travel to 6 new countries", completion_status: "70%", user_id: 3)
ActionItem.create(action: "Book flights.", isCompleted: false, goal_id: 4)
ActionItem.create(action: "Tell my boss that I'm flying out for a month.", isCompleted: true, goal_id: 4)
ActionItem.create(action: "Do research for my trip. Where will I go?", isCompleted: false, goal_id: 4)


Goal.create(title: "Eat salad for dinner 3 times a week", completion_status: "50%", user_id: 3)


Journaling.create(title: "My Toughtest Week Yet", text: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 1)
Journaling.create(title: "New Job", text: "new job, new job, new job, new job, new job new job new job new job new job new job new job new job", user_id: 1)
Journaling.create(title: "Trying A New Diet", text: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 2)
Journaling.create(title: "Great Day", text: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 2)
Journaling.create(title: "Challenge With The Girlfriend", text: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 3)
Journaling.create(title: "Disconnecting", text: "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user_id: 4)


LifeStatusTracker.create(finances: 3, dating: 6, social: 8, spiritual: 5, health:6, user_id: 1)
LifeStatusTracker.create(finances: 5, dating: 4, social: 10, spiritual: 6, health:7, user_id: 2)
LifeStatusTracker.create(finances: 3, dating: 6, social: 8, spiritual: 5, health:6, user_id: 3)
LifeStatusTracker.create(finances: 5, dating: 4, social: 10, spiritual: 6, health:7, user_id: 4)

