Rails.application.routes.draw do
  get 'artwork/index'
  resources :users
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  get     '/sign-up',    to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post ':id/follow', to: 'followings#follow_user', as: :follow_user
  post ':id/unfollow', to: 'followings#unfollow_user', as: :unfollow_user
end
