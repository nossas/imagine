class VoteSerializer < ActiveModel::Serializer
  attributes :id, :created_at
  has_one :user
end
