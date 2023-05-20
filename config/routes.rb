Rails.application.routes.draw do
  devise_for :users
  root 'users#index'

  resources :users, only: [:index, :show, :update] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:index, :new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
    member do
      get 'sign_out', to: 'users#sign_out_and_redirect'
    end
  end
end
