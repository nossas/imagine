class AddDescriptionHtmlToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :description_html, :text
  end
end
