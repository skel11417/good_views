class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :rated, :director, :poster, :actors, :imdb_id, :response
end
