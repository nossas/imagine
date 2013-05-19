class UpdatesController < InheritedResources::Base
  authorize_resource
  layout false
  belongs_to :problem
end
