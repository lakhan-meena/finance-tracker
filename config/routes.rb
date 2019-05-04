Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, :controllers => {:registrations => "user/registrations"}
  resources :users, only: [:show]
  resources :friendships
  resources :user_stocks, only: [:create, :destroy]
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_stock', to: 'stocks#search'
  get 'search_friends', to: 'users#search'
end
