class GenreMoviesController < ApplicationController
  before_action :authenticate_admin
  def create
    genre_movie = GenreMovie.new(
      genre_id: params[:genre_id],
      movie_id: params[:movie_id]
    )
    if genre_movie.save
      render json: genre_movie
    else
      render json: genre_movie.errors.full_messages
    end
  end
end
