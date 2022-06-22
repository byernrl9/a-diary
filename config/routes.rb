Rails.application.routes.draw do
  devise_for :users
  root 'homes#homes'
  resources :albums, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :diaries do
      collection do
        get 'search'
      end
    end
  end
end
