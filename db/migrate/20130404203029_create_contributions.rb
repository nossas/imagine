class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :user_id
      t.integer :idea_id
      t.text :body

      t.timestamps
    end
  end
end
