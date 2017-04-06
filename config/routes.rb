Rails.application.routes.draw do
  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'
  devise_for :users
  root to: 'start#index'
  get '/' => 'start#index'
  resources :articles do
    resources :comments
  end
  resources :tags
end
