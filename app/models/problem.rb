class Problem < ActiveRecord::Base
  attr_accessible :description, :ideas_deadline, :image, :title, :voting_deadline
  validates :description, :image, :title, :presence => true
  has_many :ideas
  belongs_to :user
end
