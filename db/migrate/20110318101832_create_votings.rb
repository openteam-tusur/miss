class CreateVotings < ActiveRecord::Migration
  def self.up
    create_table :votings do |t|
      t.references :member
      t.string :remote_ip
      t.string :remote_proxy

      t.timestamps
    end
  end

  def self.down
    drop_table :votings
  end
end
