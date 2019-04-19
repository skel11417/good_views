class UsersController < ApplicationController

  def index
    user = User.find(1)
    if params[:recent]
      render json: user.last_rated_movies
    else
      render json: user.movies
    end
  end

  def show
      user = User.find(1)
      if params[:favorites] === "all"
        render json: user.favorites
      elsif params[:favorites] === "last"
        render json: user.last_favorite
      end
  end
end
