class IdeasController < InheritedResources::Base
  belongs_to :problem
  before_filter only: [:show] { @contribution = Contribution.new }
  before_filter only: [:create] { params[:idea][:user_id] = current_user.id }
  authorize_resource

  def preview
    @idea = Idea.new(params[:idea])
    render partial: "description"
  end

  def create
    create! do |format|
      format.html { redirect_to problem_idea_path(@problem, @idea), flash: {new_idea: true} }
    end
  end
end
