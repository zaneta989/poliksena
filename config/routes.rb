Rails.application.routes.draw do
  devise_for :users
  root to: 'start#index'
  get '/' => 'start#index'
  resources :articles do
    resources :comments
  end
  resources :tags
end
