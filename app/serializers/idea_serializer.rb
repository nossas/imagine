class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :votes
  has_one :user
  has_many :votes
end
