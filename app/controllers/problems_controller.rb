class ProblemsController < InheritedResources::Base
  authorize_resource
  before_filter only: [:create] { params[:problem][:user_id] = current_user.id }
  before_filter only: [:show] { @featured_update = params[:update_id].nil? ? nil : Update.find(params[:update_id]) }

  respond_to :html, :json

  def destroy
    destroy!(:notice => "Problema removido")
  end

  def show
    show! do |format|
      format.html
      format.json do 
        render json: ProblemSerializer.new(resource)
      end
    end
  end

  def search
    problems = Problem.where("lower(description) LIKE '%#{params[:q].downcase}%'")
    respond_with problems
  end
end
