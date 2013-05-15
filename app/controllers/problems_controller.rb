class ProblemsController < InheritedResources::Base
  authorize_resource
  before_filter only: [:create] { params[:problem][:user_id] = current_user.id }

  def destroy
    destroy!(:notice => "Problema removido")
  end
end
