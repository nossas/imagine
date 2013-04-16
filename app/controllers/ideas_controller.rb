class IdeasController < InheritedResources::Base
  belongs_to :problem
  before_filter only: [:show] { @contribution = Contribution.new }
end
