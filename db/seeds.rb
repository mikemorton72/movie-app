# Movies
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

# Actors
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

# Genres
genres = ["Comedy", "Action", "Thriller", "Animated", "Documentary", "Short-Film"]
genres.each {|genre| Genre.create(name: genre)}

# Users
users = ["Bob", "Bill", "Sue", "Sally"]
users.each do |user|
  User.create(
    name: user, 
    email: "#{user.downcase}@gmail.com", 
    password: "password"
  )
end

# Add two Genres to Each Movie in genre_movie table
Movie.all.each do |movie|
  2.times do
    GenreMovie.create(
      movie_id: movie.id,
      genre_id: Genre.all.sample.id
    )
  end
end

