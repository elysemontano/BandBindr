Rails.application.routes.draw do
  get 'static_pages/landing_page'
  root 'static_pages#landing_page'
  devise_for :users
end
