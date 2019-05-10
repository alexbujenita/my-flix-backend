# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


page = 1

until page == 4
  movies = JSON.parse(RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&include_adult=false&include_video=false&page=#{page}"))
  results = movies["results"]
  results.each do |movie|
    NokoMovie.create!(movie_id: movie['id'], title: movie['title'], poster_path: movie['poster_path'], original_title: movie['original_title'], genre_ids: movie['genre_ids'].to_json, backdrop_path: movie['backdrop_path'], adult: movie['adult'], overview: movie['overview'], release_date: movie['release_date'] )
  end
  page += 1
  sleep 0.5
end