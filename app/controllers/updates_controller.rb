class UpdatesController < InheritedResources::Base
  authorize_resource
  layout false
  belongs_to :problem
  before_filter only: [:create] { params[:update][:user_id] = current_user.id }

  def create
    create! { updates_problem_path(@problem) }
  end
end
