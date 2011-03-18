class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :slug
      t.string :name
      t.text :annotation
      t.text :content
      t.string :nomination
      t.integer :priority
      t.references :contest

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
