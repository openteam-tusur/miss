class Photo < ActiveRecord::Base
  belongs_to :member
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

