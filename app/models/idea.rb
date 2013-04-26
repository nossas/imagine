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
    html_escape
    image
    youtube(:width => "100%")
    vimeo(:width => "100%")
    google_map(:width => "100%")
    link :target => "_blank"
    redcarpet { Redcarpet::Markdown.new(Redcarpet::Render::HTML, :no_intra_emphasis => true) }
  end
end
