class CreateContests < ActiveRecord::Migration
  def self.up
    create_table :contests do |t|
      t.integer :year
      t.boolean :publish
      t.boolean :current
      t.date :voting_started_on
      t.date :voting_finished_on
      t.text :sponsors

      t.timestamps
    end
  end

  def self.down
    drop_table :contests
  end
end
