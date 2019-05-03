module MoviesHelper
  
  def get_movies
    puts params
    movies = RestClient.get("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=#{params[:page]}&api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end
  
  # For decrypting
  # Rails.application.credentials.dig(:themoviedb_api)
  # &page=#{params[:page]}

end