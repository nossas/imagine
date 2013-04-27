class AddAcceptedAtToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :accepted_at, :datetime
  end
end
