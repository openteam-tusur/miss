require "paperclip/thumbnail_with_dimensions"

class Photo < ActiveRecord::Base

  belongs_to :member
  has_one :contest, :through => :member

  has_attached_file :image,
                    :url => '/photos/:contest_year/:member_slug/:id/:style.:extension',
                    :path => ':rails_root/public/photos/:contest_year/:member_slug/:id/:style.:extension',
                    :styles => {
                      :large => {
                        :geometry => "525x525",
                        :processors => [:thumbnail_with_dimensions],
                        :style_name => :large
                      },
                      :normal => {
                        :geometry => "233x",
                        :processors => [:thumbnail_with_dimensions],
                        :style_name => :normal
                      },
                      :small => {
                        :geometry => "100x",
                        :processors => [:thumbnail_with_dimensions],
                        :style_name => :small
                      }
                    },
                    :convert_options => {
                      :large => ["-quality", "99"],
                      :normal => ["-quality", "99"],
                      :small => ["-quality", "99"]
                    }

  validates_attachment_presence :image

  validates_uniqueness_of :image_fingerprint

  default_scope order("position, id")


end

# == Schema Information
#
# Table name: photos
#
#  id                        :integer         not null, primary key
#  member_id                 :integer
#  image_file_name           :string(255)
#  image_content_type        :string(255)
#  image_file_size           :integer
#  image_updated_at          :datetime
#  image_fingerprint         :string(255)
#  image_large_dimensions    :string(255)
#  image_original_dimensions :string(255)
#  image_normal_dimensions   :string(255)
#  image_small_dimensions    :string(255)
#  created_at                :datetime
#  updated_at                :datetime
#

