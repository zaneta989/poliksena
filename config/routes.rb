Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/' => 'welcome#index'
  resources :articles do
    resources :comments
  end
  resources :tags
  resources :users
end
