class AddRejectedAtToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :rejected_at, :datetime
  end
end
