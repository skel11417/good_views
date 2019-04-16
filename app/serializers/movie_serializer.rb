class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rated, :director, :poster, :actors, :imdb_id, :response
  has_many :reviews
end
