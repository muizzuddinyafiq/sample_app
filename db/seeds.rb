# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true, activated_at: Time.zone.now)

30.times do |n|
  name  = "Name #{n}"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)
  30.times do
    content = FFaker::Lorem.sentence(word_count=3)
    users.each { |user| user.microposts.create!(content: content) }
end
