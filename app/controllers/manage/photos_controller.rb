class Manage::PhotosController < Manage::ApplicationController
  belongs_to :contest do
    belongs_to :member,
               :finder => :find_by_slug
  end

  actions :create, :destroy

end
