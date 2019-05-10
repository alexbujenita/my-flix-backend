class CreateNokoMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :noko_movies do |t|
      t.integer :movie_id
      t.string :title
      t.string :poster_path
      t.string :original_title
      t.string :genre_ids
      t.string :backdrop_path
      t.boolean :adult
      t.text :overview
      t.string :release_date

      t.timestamps
    end
  end
end
