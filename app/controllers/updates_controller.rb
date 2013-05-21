class UpdatesController < InheritedResources::Base
  authorize_resource
  layout false
  belongs_to :problem

  def create
    create! { updates_problem_path(@problem) }
  end
end
