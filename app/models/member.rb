class Member < ActiveRecord::Base

  validates_presence_of :slug, :name, :annotation, :content

  belongs_to :contest

  default_scope order('position, slug')

  def to_param
    slug
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

