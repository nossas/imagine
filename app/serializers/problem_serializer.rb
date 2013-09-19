class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :hashtag, :status, :ideas, :created_at
  has_one :user

  def ideas
    object.ideas.includes(:user, votes: :user).map { |idea| IdeaSerializer.new(idea) } 
  end

  def status
    if object.contribution_closed? || object.voting_closed?
      "closed"
    else
      "open"
    end
  end
end
