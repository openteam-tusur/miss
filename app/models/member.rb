class Member < ActiveRecord::Base
  belongs_to :contest
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
#  priority   :integer
#  contest_id :integer
#  created_at :datetime
#  updated_at :datetime
#

