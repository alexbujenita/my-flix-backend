module MoviesHelper
  
  def get_movies
    movies = RestClient.get('http://api.open-notify.org/astros.json')
  end

end