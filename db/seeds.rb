require 'faker'

Book.destroy_all
User.destroy_all
Rental.destroy_all

10.times do
  Book.create(title: Faker::Book.title, author: Faker::Book.author, genre: Faker::Book.genre, body: Faker::Hipster.paragraph, owner_id: rand(10))
end

10.times do
  User.create(email: Faker::Internet.email, name: Faker::Internet.user_name)
end

5.times do 
  Rental.create(renter_id: rand(1..10), book_id: rand(1..10))
end
