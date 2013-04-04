class Contribution < ActiveRecord::Base
  attr_accessible :body, :idea_id, :user_id
end
