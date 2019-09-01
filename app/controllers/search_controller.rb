class SearchController < ApplicationController

  def index
    render json: get_movie_search
  end

  def random_movies_end
    render json: random_movies
  end

end
