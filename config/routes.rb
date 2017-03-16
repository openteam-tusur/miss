Rails.application.routes.draw do
  namespace :manage do

    resources :contests do
      member do
        put :set_current
        put :publish
      end
      resources :members do
        get :sorted, on: :collection
        put :update_sorted, on: :collection
        get :sort_photos, on: :member
        put :update_sort_photos, on: :member
        resources :photos, only: [:create, :destroy]
      end
    end

    root to: 'contests#index'
  end

  get '/:contest_id', to: 'members#index', as: :contest
  get '/:contest_id/:member_id', to: 'members#show', as: :member
  get '/:contest_id/:member_id/vote', to: 'members#voting', as: :voting, via: :post

  root to: 'members#index'
end
