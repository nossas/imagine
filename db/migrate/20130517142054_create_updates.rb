class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :image
      t.string :title
      t.text :body
      t.integer :problem_id

      t.timestamps
    end
  end
end
