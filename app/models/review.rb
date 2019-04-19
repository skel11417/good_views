class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  def self.recent_reviews
    Review.all.sort_by{ |r| r.created_at }.reverse
  end


end
