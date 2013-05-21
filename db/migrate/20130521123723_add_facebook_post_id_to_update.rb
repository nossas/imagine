class AddFacebookPostIdToUpdate < ActiveRecord::Migration
  def change
    add_column :updates, :facebook_post_id, :string
  end
end
