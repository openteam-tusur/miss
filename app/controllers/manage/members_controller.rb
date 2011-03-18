class Manage::MembersController < Manage::ApplicationController
  belongs_to :contest
  defaults :finder => :find_by_slug
end
