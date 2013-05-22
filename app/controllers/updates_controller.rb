class UpdatesController < InheritedResources::Base
  authorize_resource
  layout false
  belongs_to :problem
  before_filter only: [:create] { params[:update][:user_id] = current_user.id }

  def create
    create! do |format|
      format.html { @update.post_on_facebook and redirect_to updates_problem_path(@problem) }
    end
  end
end
