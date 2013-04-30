class Contribution < ActiveRecord::Base
  attr_accessible :body, :idea_id, :user_id, :accepted_at, :rejected_at
  validates :idea_id, :user_id, :body, :presence => true
  belongs_to :idea
  belongs_to :user
  before_create { ContributionMailer.new_contribution(self).deliver }

  def accepted?
    !accepted_at.nil?
  end
  
  def rejected?
    !rejected_at.nil?
  end
end
