class ProblemSerializer < ActiveModel::Serializer
  attributes :id, :title, :ideas

  def ideas
    object.ideas.includes(:user, votes: :user).map { |idea| IdeaSerializer.new(idea) } 
  end
end
