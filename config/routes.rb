Rails.application.routes.draw do
  resources :studios, only: [:index]
  resources :stays, only: [:create]
end
