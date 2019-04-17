class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews

  def user_movies

  end

  def last_rated_movies
    self.movies.reverse[0..5]
  end
end
