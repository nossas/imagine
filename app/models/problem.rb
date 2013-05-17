class Problem < ActiveRecord::Base
  attr_accessible :description, :ideas_deadline, :image, :title, :voting_deadline, :user_id
  validates :description, :title, :user_id, :presence => true
  has_many :ideas
  has_many :updates
  belongs_to :user
  mount_uploader :image, ProblemImageUploader

  def voting_closed?
    self.voting_deadline <= Time.now
  end
  
  def contribution_closed?
    self.ideas_deadline <= Time.now
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
