class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.recent_reviews
    Review.all.reverse
  end

  def rank_up
    user_favorites = self.user.favorites
    if !(user_favorites.empty?)
      self.rank = user_favorites.last.rank + 1
    else
      self.rank = 1
    end
  end
end
