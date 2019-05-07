class CreditsController < ApplicationController

    def index
      render json: get_movie_credits
    end

end