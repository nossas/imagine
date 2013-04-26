class IdeasController < InheritedResources::Base
  belongs_to :problem
  before_filter only: [:show] { @contribution = Contribution.new }
  before_filter only: [:create] { params[:idea][:user_id] = current_user.id }
  authorize_resource

  def preview
    @idea = Idea.new(params[:idea])
    render partial: "description"
  end
end
