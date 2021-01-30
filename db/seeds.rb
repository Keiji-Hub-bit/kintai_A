# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             admin: true)
User.create!(name: "上長A",
             email: "sample1@email.com",
             password: "password",
             superior: true)
User.create!(name: "上長B",
             email: "sample2@email.com",
             password: "password",
             superior: true)

4.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               )
end
