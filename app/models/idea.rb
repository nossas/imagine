class Idea < ActiveRecord::Base
  attr_accessible :description, :problem_id, :title, :user_id
  validates :description, :problem_id, :title, :user_id, :presence => true
  validate :ideas_submission_deadline, :on => :create
  belongs_to :problem
  belongs_to :user
  has_many :votes
  has_many :contributions
  
  def to_param
    "#{self.id}-#{self.title.parameterize}"
  end

  def as_json options
    super({include: :user}.merge(options))
  end

  auto_html_for :description do
    html_escape
    image
    youtube(:width => "100%")
    vimeo(:width => "100%")
    google_map(:width => "100%")
    link :target => "_blank"
    redcarpet { Redcarpet::Markdown.new(Redcarpet::Render::HTML, :no_intra_emphasis => true) }
  end

  private

  def ideas_submission_deadline
    errors.add(:ideas_submission_deadline, "") if Problem.find(self.problem_id).contribution_closed?
  end
end
