class Update < ActiveRecord::Base
  attr_accessible :body, :image, :problem_id, :title, :user_id, :message, :facebook_post_id, :video
  validates :title, :body, :problem_id, :user_id, :presence => true
  belongs_to :problem
  belongs_to :user
  mount_uploader :image, UpdateImageUploader
  default_scope order("created_at DESC")
  after_save {|update| self.delay.post_on_facebook if update.facebook_post_id.nil? }

  def post_on_facebook
    user_graph = Koala::Facebook::API.new(self.user.token)
    page_token = user_graph.get_page_access_token(ENV["FACEBOOK_PAGE_ID"])
    page_graph = Koala::Facebook::API.new(page_token)
    facebook_post = page_graph.put_connections(
      ENV["FACEBOOK_PAGE_ID"], 
      'feed', 
      :message => self.message,
      :link => Rails.application.routes.url_helpers.updates_problem_url(self.problem, anchor: "update_#{self.id}", update_id: self.id)
    )
    self.update_attributes facebook_post_id: facebook_post["id"]
  end

  def thumb
    if self.video
      "http://img.youtube.com/vi/#{self.video[/(?<=[?&]v=)[^&$]+/]}/0.jpg"
    else
      self.image.thumb.url
    end
  end

  auto_html_for :video do
    youtube(:width => "100%")
  end
end
