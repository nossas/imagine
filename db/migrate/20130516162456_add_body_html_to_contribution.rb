class AddBodyHtmlToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :body_html, :text
  end
end
