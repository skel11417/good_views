class MoviesController < ApplicationController
  def index
    title = params[:title]
    render json: Movie.all
    # OMDB_API_KEY

  end
end
