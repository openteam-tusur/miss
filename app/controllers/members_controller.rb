class MembersController < ApplicationController
  before_filter :find_contest

  def index
    redirect_to root_path and return if @contest.blank?
    @members = @contest.members
  end

  def show
    redirect_to root_path and return if @contest.blank?
    @member = @contest.members.find_by_slug(params[:member_id])
    redirect_to root_path and return if @member.blank?
  end

  def voting
    @member = @contest.members.find_by_slug(params[:member_id])
    Voting.vote(@member, request)
    if params[:type].eql?("list_voting")
      @members = @contest.members
      render :file => "members/index.html.erb", :layout => false and return if request.xhr?
    end
    if params[:type].eql?("single_voting")
      render :file => "members/show.html.erb", :layout => false and return if request.xhr?
    end
    redirect_to :back
  end

  private
    def find_contest
      @contest = params[:contest_id] ? Contest.find_by_year(params[:contest_id]) : Contest.current
    end
end

