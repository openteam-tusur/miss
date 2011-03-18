class Manage::MembersController < Manage::ApplicationController
  belongs_to :contest
  defaults :finder => :find_by_slug

  custom_actions :collection => [:sorted, :update_sorted]

  def update_sorted
    index do
      @contest.update_sorted_members(params[:members])
      redirect_to manage_contest_members_path(@contest) and return
    end
  end
end
