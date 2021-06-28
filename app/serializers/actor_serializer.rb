class ActorSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name,:known_for, :age, :gender, :movie
end
