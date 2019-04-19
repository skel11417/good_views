class UsersController < ApplicationController

  def index
    user = User.first
    if params[:recent]
      render json: user.last_rated_movies
    else
      render json: user.movies
    end
  end

end
