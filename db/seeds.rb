require 'random_data'

5.times do
  User.create!(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

users = User.all

10.times do
  Wiki.create!(
    title: Faker::Pokemon.name,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

10.times do
  Wiki.create!(
    title: Faker::Superhero.name,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

User.create!(
  email: 'admin@example.com',
  password: 'password',
  role: 'admin'
)

User.create!(
  email: 'premium@example.com',
  password: 'password',
  role: 'premium'
)

User.create!(
  email: 'standard@example.com',
  password: 'password',
  role: 'standard'
)

puts "seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
