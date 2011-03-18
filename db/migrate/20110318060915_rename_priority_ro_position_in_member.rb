class RenamePriorityRoPositionInMember < ActiveRecord::Migration
  def self.up
    rename_column :members, :priority, :position
  end

  def self.down
    rename_column :members, :position, :priority
  end
end
