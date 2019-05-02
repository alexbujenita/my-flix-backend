class MoviesController < ApplicationController

  def index
    render json: get_movies
  end

end
