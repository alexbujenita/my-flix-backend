class MoviesController < ApplicationController

  def index
    render json: get_movies
  end

  def show
    render json: get_one_movie
  end

end
