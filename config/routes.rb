Rails.application.routes.draw do
  root 'homes#homes'
  resources :albums, only: [:index]
end
