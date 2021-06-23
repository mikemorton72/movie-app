class MoviesController < ApplicationController
  def index
    render json: Movie.order(:title).as_json
  end

  def show
    render json: Movie.find_by(id: params[:id]).as_json
  end
end
