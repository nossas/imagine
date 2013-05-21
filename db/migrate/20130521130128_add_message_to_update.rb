class AddMessageToUpdate < ActiveRecord::Migration
  def change
    add_column :updates, :message, :text
  end
end
