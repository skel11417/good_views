class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.recent_reviews
    Review.all.reverse
  end
end
