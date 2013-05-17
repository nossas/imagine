class Update < ActiveRecord::Base
  attr_accessible :body, :image, :problem_id, :title
  validates :title, :body, :image, :problem_id, :presence => true
  belongs_to :problem
  mount_uploader :image, UpdateImageUploader
end
