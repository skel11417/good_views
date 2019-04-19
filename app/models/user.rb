class User < ApplicationRecord
  has_many :reviews
  has_many :movies, through: :reviews

  def user_movies

  end

  def last_rated_movies
    self.reviews.sort_by{ |r| r.created_at }
    # self.reviews.reverse[0..5]
  end

  def favorites
    self.reviews.select{ |r| r.rank != nil}
  end

  def last_favorite
    self.favorites.last.rank
  end

  # def user_favorite_movies
  #   self.favorites.map { |f| f.movie }
  # end
end
