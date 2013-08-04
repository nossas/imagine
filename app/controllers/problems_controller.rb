class ProblemsController < InheritedResources::Base
  authorize_resource
  before_filter only: [:create] { params[:problem][:user_id] = current_user.id }
  before_filter only: [:show] { @featured_update = params[:update_id].nil? ? nil : Update.find(params[:update_id]) }

  def destroy
    destroy!(:notice => "Problema removido")
  end

  def show
    show! do |format|
      format.html
      format.json { render json: ProblemSerializer.new(resource) }
    end
  end
end
