module MoviesHelper
  
  def get_movies
    puts params
    # movies = RestClient.get("https://api.themoviedb.org/3/discover/movie?sort_by=popularity.desc&page=#{params[:page]}&api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
    movies = RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&include_adult=false&include_video=false&page=#{params[:page]}")
  end

  def get_one_movie
    puts params
    movie = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  def get_movie_credits
    credits = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/credits?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  def get_movie_trailers
    trailers = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/videos?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  # For decrypting
  # Rails.application.credentials.dig(:themoviedb_api)
  # &page=#{params[:page]}

end