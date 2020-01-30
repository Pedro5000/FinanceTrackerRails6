Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'my-portfolio', to: 'users#my_portfolio'
  get 'search-stock', to: 'stocks#search'
  get 'quick-search-stock', to: 'stocks#quick_search'
end