class NokoMovieSerializer < ActiveModel::Serializer
  attributes :id, :movie_id, :title, :poster_path, :original_title, :genre_ids, :backdrop_path, :adult, :overview, :release_date
end
