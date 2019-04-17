class UsersController < ApplicationController

  def index
    user = User.find(1)
    if params[:recent]
      render json: user.last_rated_movies
    else
      render json: user.movies
    end
  end
  
end
