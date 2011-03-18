class Manage::PhotosController < Manage::ApplicationController
  belongs_to :contest, :finder => :find_by_year do
    belongs_to :member,
               :finder => :find_by_slug
  end

  actions :create, :destroy

end
