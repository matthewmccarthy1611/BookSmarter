# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# # Genre.create(name: "History")
# # Genre.create(name: "Personal Development")
# # Genre.create(name: "Economics")
# # Genre.create(name: "Fiction")

User.create(email: "test1@examples.com", password: "abcd1234", name: "Bill")
User.create(email: "test2@examples.com", password: "abcd1234", name: "Fred")
User.create(email: "test3@examples.com", password: "abcd1234", name: "Linda")
User.create(email: "test4@examples.com", password: "abcd1234", name: "Sally")

Book.create(title: "Basic Economics", author: "Thomas Sowell", page_count: 600)
Book.create(title: "Alexander Hamilton", author: "Ron Chernow", page_count: 570)
# Book.create(title: "The New Right", author: "Michael Malice", page_count: 280)
Book.create(title: "Atomic Habits", author: "James Clear", page_count: 250)
Book.create(title: "Starting Strength", author: "Mark Rippetoe", page_count: 600)
Book.create(title: "The Fountainhead", author: "Ayn Rand", page_count: 800)
Book.create(title: "KJV Bible", author: "God", page_count: 1800)
Book.create(title: "12 Rules for Life", author: "Jordan Peterson", page_count: 450)
Book.create(title: "Theory and History", author: "Ludwig von Mises", page_count: 450)
Book.create(title: "Modern Times", author: "Paul Johnson", page_count: 450)
Book.create(title: "Man, Economy, and State", author: "Murray N. Rothbard", page_count: 450)

Comment.create(content: "Good", user: User.find_by(email: "test2@examples.com") , book: Book.find_by(title: "Basic Economics"))
Comment.create(content: "total trash!", user: User.find_by(email: "test1@examples.com") , book: Book.find_by(title: "The New Right"))
Comment.create(content: "this is making me stronger", user: User.find_by(email: "test2@examples.com") , book: Book.find_by(title: "Starting Strength"))
Comment.create(content: "too long!", user: User.find_by(email: "test4@examples.com") , book: Book.find_by(title: "The Fountainhead"))
Comment.create(content: "Wow", user: User.find_by(email: "test4@examples.com") , book: Book.find_by(title: "Basic Economics"))
Comment.create(content: "fresh af", user: User.find_by(email: "test1@examples.com") , book: Book.find_by(title: "Atomic Habits"))
Comment.create(content: "im cringing", user: User.find_by(email: "test2@examples.com") , book: Book.find_by(title: "Atomic Habits"))
Comment.create(content: "sa good", user: User.find_by(email: "test4@examples.com") , book: Book.find_by(title: "Alexander Hamilton"))
