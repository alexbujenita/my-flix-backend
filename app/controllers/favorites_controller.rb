class FavoritesController < ApplicationController
  def my_favorites
    if logged_in
      render json: User.find(no_call_current_user[:user_id]).user_favorites
    else 
      render json: {error: "Movies not available."}
    end
  end
end
