class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :movie_id, :content, :rating, :rank
  belongs_to :movie
  belongs_to :user
end
