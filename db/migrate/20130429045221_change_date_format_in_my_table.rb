class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def self.up
    change_column :contests, :voting_started_on, :datetime
    change_column :contests, :voting_finished_on, :datetime
  end

  def self.down
    change_column :contests, :voting_started_on, :date
    change_column :contests, :voting_finished_on, :date
  end
end
