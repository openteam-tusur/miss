class Manage::ContestsController < Manage::ApplicationController
  defaults :finder => :find_by_year
  actions :all, :except => [:show]
  custom_actions :resource => [:set_current, :publish]

  def set_current
    edit do
      Contest.set_current(@contest)
      redirect_to manage_contests_path and return
    end
  end

  def publish
    edit do
      @contest.published = !@contest.published
      @contest.save
      redirect_to manage_contests_path and return
    end
  end
end
