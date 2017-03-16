class Member < ActiveRecord::Base

  validates_presence_of :slug, :name, :annotation, :content

  belongs_to :contest
  has_many :photos, :dependent => :destroy
  has_many :votings, :dependent => :destroy

  default_scope { order('position, slug') }

  def to_param
    slug
  end

  def update_sort_photos(photo_ids)
    photo_ids.each_with_index do |photo_id, index|
      photos.find(photo_id).update_attribute(:position, index+1)
    end
  end

  def main_photo
    photos.first
  end

  def other_photos
    photos[1..photos.size-1]
  end
end


# == Schema Information
#
# Table name: members
#
#  id         :integer         not null, primary key
#  slug       :string(255)
#  name       :string(255)
#  annotation :text
#  content    :text
#  nomination :string(255)
#  position   :integer
#  contest_id :integer
#  created_at :datetime
#  updated_at :datetime
#

