Rails.application.routes.draw do
  resources :user_stocks, only: [:create, :destroy]
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my-portfolio', to: 'users#my_portfolio'
  get 'search-stock', to: 'stocks#search'
  get 'quick-search-stock', to: 'stocks#quick_search'
  get 'friends', to: 'users#friends'
  get 'search-friend', to: 'users#search'
  resources :friendships, only: [:create, :destroy]
  resources :users, only: [:show]

end
