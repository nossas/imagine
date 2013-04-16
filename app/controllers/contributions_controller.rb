class ContributionsController < InheritedResources::Base
  belongs_to :idea

  def create
    create! do |success, failure|
      success.html { redirect_to problem_idea_path(@idea.problem, @idea), flash: { contribution_notice: true } }
      failure.html { raise "Fail to create contribution" }
    end
  end
end
