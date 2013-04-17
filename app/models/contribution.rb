class Contribution < ActiveRecord::Base
  attr_accessible :body, :idea_id, :user_id
  validates :idea_id, :user_id, :body, :presence => true
  belongs_to :idea
  belongs_to :user
  before_create { ContributionMailer.new_contribution(self).deliver }
end
