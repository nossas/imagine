class Update < ActiveRecord::Base
  attr_accessible :body, :image, :problem_id, :title, :user_id, :message, :facebook_post_id
  validates :title, :body, :image, :problem_id, :user_id, :presence => true
  belongs_to :problem
  belongs_to :user
  mount_uploader :image, UpdateImageUploader
  default_scope order("created_at DESC")
  after_create :post_on_facebook

  def post_on_facebook
    raise self.reload.image.url.inspect
    user_graph = Koala::Facebook::API.new(self.user.token)
    page_token = user_graph.get_page_access_token(ENV["FACEBOOK_PAGE_ID"])
    page_graph = Koala::Facebook::API.new(page_token)
    facebook_post = page_graph.put_connections(
      ENV["FACEBOOK_PAGE_ID"], 
      'feed', 
      :message => self.message, 
      :link => Rails.application.routes.url_helpers.updates_problem_url(self.problem, anchor: "update_#{self.id}", update_id: self.id),
      :picture => self.image.url,
      :name => self.title,
      :description => self.body
    )
    self.update_attributes facebook_post_id: facebook_post["id"]
  end
end
