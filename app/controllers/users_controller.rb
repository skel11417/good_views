class UsersController < ApplicationController

  def index
    user = User.first
    if params[:recent]
      render json: user.last_rated_movies
    else
      render json: user.movies
    end
  end

  def show
      user = User.first
      if params[:favorites] === "all"
        render json: user.favorites
      elsif params[:favorites] === "last"
        render json: user.last_favorite
      end
  end
end
