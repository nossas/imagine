class Contribution < ActiveRecord::Base
  attr_accessible :body, :idea_id, :user_id
  validates :idea_id, :user_id, :body, :presence => true
end
