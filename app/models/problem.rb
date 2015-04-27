class Problem < ActiveRecord::Base
  attr_accessible :description, :ideas_deadline, :image, :title, :voting_deadline, :user_id, :objectives, :hashtag
  validates :description, :title, :user_id, :objectives, :presence => true
  has_many :ideas
  has_many :updates
  belongs_to :user
  mount_uploader :image, ProblemImageUploader

  before_create :set_default_organization

  def voting_closed?
    self.voting_deadline <= Time.now
  end

  def contribution_closed?
    self.ideas_deadline <= Time.now
  end

  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def as_json options
    super({include: [:user, ideas: {include: :user}]}.merge(options))
  end

  def set_default_organization
    self.organization_id = ENV["MEURIO_ORGANIZATION_ID"]
  end
end
