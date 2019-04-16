class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rated, :director, :poster, :actors, :imdb_id, :response, :plot
  has_many :reviews
end
