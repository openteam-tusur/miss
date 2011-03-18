class RenamePublishToPublishedInContest < ActiveRecord::Migration
  def self.up
    rename_column :contests, :publish, :published
  end

  def self.down
    rename_column :contests, :published, :publish
  end
end
