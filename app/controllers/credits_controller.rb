# frozen_string_literal: true

# Controller to get the movies credits
class CreditsController < ApplicationController
  def index
    render json: get_movie_credits
  end
end
