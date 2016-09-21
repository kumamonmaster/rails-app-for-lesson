Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users

  resources :users, only: [:index, :show] do
    member do
      get :favorites
    end
  end

  resources :tweets do
    resource :favorites, only: [:create, :destroy]
  end
end
