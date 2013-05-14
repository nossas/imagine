class ProblemsController < InheritedResources::Base
  authorize_resource
  before_filter only: [:create] { params[:problem][:user_id] = current_user.id }
end
