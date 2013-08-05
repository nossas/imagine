class IdeaSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :votes, :created_at
  has_one :user
  has_many :votes
end
