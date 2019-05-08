class AddMovieTitleToUserFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :user_favorites, :movie_title, :string
    add_column :user_favorites, :movie_poster_path, :string
    add_column :user_favorites, :seen, :boolean, :default => 0
    add_column :user_favorites, :description, :text
  end
end
