class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :year, :plot, :director, :english, :actors, :genre_names
end
