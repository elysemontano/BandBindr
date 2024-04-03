Rails.application.routes.draw do
  resources :organizations do
    resources :people do 
      resources :keys, only: [:new]
    end
    resources :songs do 
      resources :song_tags
      resources :keys, only: [:new]
    end
    resources :tags
    resources :keys, only: [:index, :show, :create, :update, :destroy]
  end

  # Members are scoped through organizations:
  resources :organizations do
    resources :members do
      # allows member to be invited:
      collection do
        post :invite
      end
    end
  end

  get 'static_pages/landing_page'
  get 'static_pages/account_page'
  root 'static_pages#landing_page'

  devise_for :users
end
