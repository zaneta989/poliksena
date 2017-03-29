Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  get '/' => 'welcome#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :users
end
