class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.string :image
      t.datetime :ideas_deadline
      t.datetime :voting_deadline

      t.timestamps
    end
  end
end
