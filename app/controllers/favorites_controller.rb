class FavoritesController < ApplicationController
  def my_favorites
    if logged_in
      render json: User.find(no_call_current_user[:user_id]).user_favorites
    else 
      render json: {error: "Movies not available."}
    end
  end


  def add_favorites
    user_id = no_call_current_user[:user_id]
    UserFavorite.create!(user_id: user_id, movie_ref_id: params[:movie_ref_id], movie_title: params[:movie_title], movie_poster_path: params[:movie_poster_path])
  end

  def remove_favorite
    user_id = no_call_current_user[:user_id]
    movie = UserFavorite.find_by(movie_ref_id: params[:movie_id], user_id: user_id)
    UserFavorite.destroy(movie.id)
    render json: { success: "Movie removed" }
  end

end
