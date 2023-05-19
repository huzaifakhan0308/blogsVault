Rails.application.routes.draw do
 devise_for :users
 root 'users#index'

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  get 'users/:id/sign_out', to: 'users#sign_out_and_redirect', as: :sign_out_user
  resources :users, only: [:show]
end
