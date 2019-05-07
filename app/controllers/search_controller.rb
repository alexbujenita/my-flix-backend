class SearchController < ApplicationController

  def index
    render json: get_movie_search
  end

end
