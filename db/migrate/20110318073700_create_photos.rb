class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.references :member
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :image_fingerprint
      t.string :image_large_dimensions
      t.string :image_original_dimensions
      t.string :image_normal_dimensions
      t.string :image_small_dimensions

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
