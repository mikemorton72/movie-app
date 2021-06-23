class MoviesController < ApplicationController
  def index
    render json: Movie.order(:title).as_json
  end

  def show
    render json: Movie.find_by(id: params[:id]).as_json
  end

  def create
    movie = Movie.new(
      title: params[:title],
      year: params[:year],
      plot: params[:plot],
      director: params[:director],
      english: params[:english]
    )
    if movie.save
      render json: movie.as_json
    else
      render json: movie.errors.full_messages
    end
  end
  
  def update
    movie = Movie.find_by(id: params[:id])
    movie.title = params[:title] || movie.title
    movie.year = params[:year] || movie.year
    movie.plot = params[:plot] || movie.plot
    movie.director = params[:director] || movie.director
    movie.english = params[:english] || movie.english
    if movie.save
      render json: movie.as_json
    else
      render json: movie.errors.full_messages
    end
  end
end
