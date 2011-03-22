class AddAdditionalToContest < ActiveRecord::Migration
  def self.up
    add_column :contests, :additional, :text
  end

  def self.down
    remove_column :contests, :additional
  end
end

