Rails.application.routes.draw do
  # Members are scoped through organizations:
  resources :organizations do
    resources :members
  end
  get 'static_pages/landing_page'
  root 'static_pages#landing_page'
  devise_for :users
end
