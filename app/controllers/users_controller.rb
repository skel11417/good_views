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
      if params[:favorites]
        render json: user.favorites
      end
  end
end
