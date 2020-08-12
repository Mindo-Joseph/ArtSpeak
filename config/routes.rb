Rails.application.routes.draw do
  resources :users
  resources :opinions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'homepage#index'
  get     '/sign-up',    to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  post '/follow', to: 'Followings#follow_user'
  post '/unfollow', to: 'Followings#unfollow_user'
end
