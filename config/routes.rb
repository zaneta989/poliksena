Rails.application.routes.draw do
  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'

  end
  match '/users/:id',     to: 'users#show',       via: 'get'
  devise_for :users, :path_prefix => 'd'
  resources :users, :only =>[:show]
  root to: 'start#index'
  get '/' => 'start#index'

  resources :articles do
    resources :comments
  end
  resources :tags
end
