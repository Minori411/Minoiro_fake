Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get '/users', to: redirect("/users/sign_up")
    get "signup", :to => "users/registrations#new"
    post "signup", :to => "users/registrations#create"
    get "login", :to => "users/sessions#new"
    post 'login', to: 'users/sessions#create'
    delete "logout", :to => "users/sessions#destroy"
  end

  get '/users/:id/unsubscribe', :to => 'users#unsubscribe', as: 'unsubscribe'
  delete '/users/:id/withdrawal', :to => 'users#withdrawal', as: 'withdrawal'

  get "users/index", to: "users#index"

  root :to => "home#index"
  
  get "sample", to: "sample#index"
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
