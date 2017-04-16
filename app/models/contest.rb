class Contest < ActiveRecord::Base

  attr_accessible :year, :published, :current,
    :voting_started_on, :voting_finished_on,
    :sponsors

  validates_presence_of :year, :voting_started_on, :voting_finished_on
  validates_uniqueness_of :year

  default_scope { order(year: :desc) }
  scope         :published, -> { where(published: true) }

  has_many :members, :dependent => :destroy

  def self.current
    self.where(:current => true).first
  end

  def self.set_current(contest)
    self.update_all(current: false)
    contest.current = true
    contest.save
  end

  def to_param
    year.to_s
  end

  def during_voting?
    return true if Time.zone.now.between?(voting_started_on, voting_finished_on)

    false
  end

  def update_sorted_members(members_ids)
    members_ids.each_with_index do |member_id, index|
      members.find(member_id).update_attribute(:position, index + 1)
    end
  end

end


# == Schema Information
#
# Table name: contests
#
#  id                 :integer          not null, primary key
#  year               :integer
#  published          :boolean
#  current            :boolean
#  voting_started_on  :datetime
#  voting_finished_on :datetime
#  sponsors           :text
#  created_at         :datetime
#  updated_at         :datetime
#  additional         :text
#
