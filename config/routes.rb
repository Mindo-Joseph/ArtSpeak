Rails.application.routes.draw do
  get 'artwork/index'
  resources :users
  resources :opinions
  root 'homepage#index'
  get     '/sign-up',    to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post ':id/follow', to: 'followings#create', as: :follow_user
  post ':id/unfollow', to: 'followings#destroy', as: :unfollow_user
end
