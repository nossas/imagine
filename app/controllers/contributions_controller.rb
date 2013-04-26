class ContributionsController < InheritedResources::Base
  belongs_to :idea
  authorize_resource

  prepend_before_filter only: [:create] do
    session[:contribution] = params[:contribution] and redirect_to("/auth/facebook") and return if current_user.nil?
  end
  
  before_filter only: [:create] do
    params[:contribution] = session.delete(:contribution) if session[:contribution]
    params[:contribution][:user_id] = current_user.id
  end

  def create
    create! do |success, failure|
      success.html { redirect_to problem_idea_path(@idea.problem, @idea), flash: { contribution_notice: true } }
      failure.html { raise "Fail to create contribution" }
    end
  end
end
