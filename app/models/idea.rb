class Idea < ActiveRecord::Base
  attr_accessible :description, :problem_id, :title, :user_id
  validates :description, :problem_id, :title, :user_id, :presence => true
  belongs_to :problem
  belongs_to :user
  has_many :votes
  has_many :contributions
  
  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  auto_html_for :description do
    image
  end
end
