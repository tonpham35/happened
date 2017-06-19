Rails.application.routes.draw do

  resources :friendships
  resources :events

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/' => 'users#index', :as => :users_index
  get 'users/' => 'users#home', :as => :users_home

  resources :stories, controller: "stories", only: [:create, :show]

  root 'users#home'

end
