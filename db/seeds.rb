# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "json"
require "open-uri"

# Insert movies
puts 'Creating movies...'
url = "https://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E"
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
# p movies
movies_results = movies['results']
# movies_results[0]["original_title"]
Movie.destroy_all
movies_results.each do |m|
  movie = Movie.create(
    title: m['original_title'],
    overview: m['overview'],
    rating: m['vote_average'],
    poster_url: "https://image.tmdb.org/t/p/original#{m['poster_path']}"
  )
  puts "Movie with id: #{movie.title} has been created"
end
