Rails.application.routes.draw do
  get '/' => 'welcome#index'
  resources :articles do
    resources :comments
    resources :tags, :only => [:index, :show, :delete]
    end
end
