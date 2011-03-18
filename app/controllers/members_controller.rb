class MembersController < ApplicationController
  before_filter :find_contest

  def index
    @members = @contest.members
  end

  def show
    @member = @contest.members.find_by_slug(params[:member_id])
  end

  def voting
    @member = @contest.members.find_by_slug(params[:member_id])
    Voting.vote(@member, request)
    redirect_to :back
  end

  private
    def find_contest
      @contest = params[:contest_id] ? Contest.find_by_year(params[:contest_id]) : Contest.current
    end
end
