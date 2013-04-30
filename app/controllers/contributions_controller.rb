class ContributionsController < InheritedResources::Base
  belongs_to :idea, :optional => true
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

  def pending_contributions
    @user = User.find(params[:user_id])
  end

  def accept
    Contribution.find(params[:contribution_id]).update_attributes accepted_at: Time.now
    redirect_to user_pending_contributions_path(current_user)
  end

  def reject
    Contribution.find(params[:contribution_id]).update_attributes rejected_at: Time.now
    redirect_to user_pending_contributions_path(current_user)
  end
end
