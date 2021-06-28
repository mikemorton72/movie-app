# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
  movie = Movie.new(
    title: FFaker::Movie.title, 
    year: FFaker::Vehicle.year, 
    plot: FFaker::Lorem.paragraph,
    director: FFaker::Name.name,
    english: FFaker::Boolean.maybe,
  )
  movie.save
end

100.times do
  actor = Actor.new(
    first_name: FFaker::Name.first_name,
    last_name: FFaker::Name.last_name,
    known_for: FFaker::Movie.title,
    gender: FFaker::Gender.random,
    age: rand(1..120),
    movie_id: Movie.all.sample.id
  )
  actor.save
end