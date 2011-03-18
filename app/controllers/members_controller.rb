class MembersController < ApplicationController
  before_filter :find_contest

  def index
    @members = @contest.members
  end

  def show
    @members = @contest.members.find_by_slug(params[:member_id])
  end

  private
    def find_contest
      @contest = params[:contest_id] ? Contest.find_by_year(params[:contest_id]) : Contest.current
    end
end
