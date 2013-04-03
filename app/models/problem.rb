class Problem < ActiveRecord::Base
  attr_accessible :description, :ideas_deadline, :image, :title, :voting_deadline, :user_id
  validates :description, :title, :user_id, :presence => true
  has_many :ideas
  belongs_to :user

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end
end
