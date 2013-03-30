class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.integer :problem_id
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
