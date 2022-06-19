Rails.application.routes.draw do
  devise_for :users
  root 'homes#homes'
  resources :albums, only: [:index, :new, :create] do
    resources :diaries
  end
end
