class TrailersController < ApplicationController

    def index
      render json: get_movie_trailers
    end

end