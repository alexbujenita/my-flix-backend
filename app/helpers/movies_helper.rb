module MoviesHelper
  
  def get_movies
    movies = RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&include_adult=false&include_video=false&page=#{params[:page]}")
  end

  def get_one_movie
    movie = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  def get_movie_credits
    credits = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/credits?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  def get_movie_trailers
    trailers = RestClient.get("https://api.themoviedb.org/3/movie/#{params[:movie_id]}/videos?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}")
  end

  def get_movie_search
    movies = RestClient.get("https://api.themoviedb.org/3/search/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&query=#{params[:search_term]}&page=#{params[:page]}&include_adult=#{params[:adult]}")
  end

  def random_movies
    movies = []
    until movies.length == 10
      query = random_query
      movie1 = JSON.parse(query)['results'].sample
      movie2 = JSON.parse(query)['results'].sample
      movies.push(movie1)
      movies.push(movie2)
    end
    movies.uniq.to_json
  end

  def actors_movies_search
    movies = []
    page_number = 1
    search = search_actor_pages(page_number, params[:id])
    movies.push(search['results'])
    total_pages = search['total_pages']
    until page_number == total_pages
      page_number += 1
      search = search_actor_pages(page_number, params[:id])
      movies.push(search['results'])
    end
    movies
  end

  private

  def search_actor_pages(page_number, actor_id)
    JSON.parse(RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&sort_by=popularity_desc&include_adult=true&include_video=false&page=#{page_number}&with_people=#{actor_id}"))
  end

  def random_query
    def rand1
      RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&include_adult=false&include_video=false&page=#{rand(1..500)}")
    end
    def rand2
      RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&sort_by=revenue.desc&include_adult=false&include_video=false&page=#{rand(1..500)}")
    end
    def rand3
      RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&sort_by=original_title.asc&include_adult=false&include_video=false&page=#{rand(1..500)}")
    end
    def rand4
      RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&sort_by=release_date.asc&include_adult=false&include_video=false&page=#{rand(1..500)}")
    end
    def rand5
      RestClient.get("https://api.themoviedb.org/3/discover/movie?api_key=#{Rails.application.credentials.dig(:themoviedb_api)}&language=en-US&include_adult=true&include_video=false&page=#{rand(1..500)}")
    end
    queries = [method(:rand1), method(:rand2), method(:rand3), method(:rand4), method(:rand5)]
    queries.sample.call
  end
  # For decrypting
  # Rails.application.credentials.dig(:themoviedb_api)
  # &page=#{params[:page]}

end