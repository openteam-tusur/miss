# encoding: utf-8
require 'spec_helper'

describe Contest do

  before(:each) do
    @contest = Factory.create(:contest, :year => "2010")
  end

  it "должен сортироваться по годам в обратном порядке" do
    contest_2011  = Factory.create(:contest, :year => "2011")
    contest_2009  = Factory.create(:contest, :year => "2009")
    Contest.all.should eql [contest_2011, @contest, contest_2009]
  end

  it "должен уметь ставить текущий конкурс" do
    contest_2011  = Factory.create(:contest, :year => "2011", :current => true)
    Contest.current.should eql contest_2011
    Contest.set_current(@contest)
    Contest.current.should eql @contest
    contest_2011.reload.current?.should be false
  end

  describe "должен знать возможность голосования за участниц" do
    it "если дата начала больше текущей и дата окончания меньше текущей" do
      @contest.during_voting?.should be true
    end
    it "если дата начала больше текущей" do
      @contest.voting_started_on = Date.today + 1.day
      @contest.save
      @contest.during_voting?.should be false
    end
    it "если дата окончания больше текущей" do
      @contest.voting_finished_on = Date.today - 1.day
      @contest.save
      @contest.during_voting?.should be false
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
