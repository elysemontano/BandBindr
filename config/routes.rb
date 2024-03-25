Rails.application.routes.draw do
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
  root 'static_pages#landing_page'
  devise_for :users
end
