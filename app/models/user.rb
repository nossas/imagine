class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :image, :last_name, :uid
  validates :email, :first_name, :presence => true
  validates :email, :uniqueness => true
  has_many :votes

  def name
    "#{first_name} #{last_name}"
  end

  def can_vote_for? idea
    self.votes.where(idea_id: idea.id).empty?
  end
end
