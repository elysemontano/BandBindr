Rails.application.routes.draw do
  devise_for :users
  resources :organizations do
    resources :people do 
      resources :keys, only: [:new, :create, :destroy]
    end
    resources :songs do 
      collection do 
        get 'live_search'
      end
      resources :song_tags
      resources :keys, only: [:new, :create, :destroy]
    end
    resources :tags
    resources :keys, only: [:index, :show]
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

  get 'static_pages/account_page'
  root 'static_pages#landing_page'
  get 'change_password', to: 'users#change_password'
  patch 'update_password', to: 'users#update_password'
end
