Rails.application.routes.draw do
  mount RailsAdmin::Engine => '//admin', as: 'rails_admin'

  devise_for :users,
             controllers: {
                 registrations:  "users/registrations",
                 confirmations:  "users/confirmations",
                 sessions:       "users/sessions",
                 passwords:      "users/passwords",
             }, :path_names => {:sign_in => "login", :sign_out => "logout"}

  resources :users, only: [:show]


  root to: 'start#index'
  get '/' => 'start#index'

  resources :articles do
    resources :comments
  end
  resources :tags
end
