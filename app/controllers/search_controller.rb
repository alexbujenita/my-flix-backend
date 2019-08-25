class SearchController < ApplicationController

  def index
    puts get_movie_search
    render json: get_movie_search
  end

  def random_movies_end
    render json: random_movies
  end

end
