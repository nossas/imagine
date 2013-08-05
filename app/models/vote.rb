class Vote < ActiveRecord::Base
  attr_accessible :idea_id, :user_id
  validates :idea_id, :user_id, presence: true
  validates :user_id, uniqueness: {:scope => :idea_id}

  belongs_to :idea
  belongs_to :user
end
