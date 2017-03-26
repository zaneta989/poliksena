Rails.application.routes.draw do
  get 'users/new'

  get '/' => 'welcome#index'
  resources :articles do
    resources :comments
  end
  resources :tags
end
