class AddObjectivesToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :objectives, :text
  end
end
