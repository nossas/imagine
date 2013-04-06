class VotesController < InheritedResources::Base
  belongs_to :idea

  before_filter only: [:create] do
    session[:idea_id] = params[:idea_id] and redirect_to("/auth/facebook") and return if current_user.nil?
    params[:vote] = params[:vote] || {}
    params[:vote][:user_id] = current_user.id
    params[:vote][:idea_id] = params[:idea_id]
  end

  def create
    create! do |success, failure|
      success.html { redirect_to problem_idea_path(@idea.problem, @idea), notice: true }
      failure.html { raise "Fail to create vote" }
    end
  end
end
