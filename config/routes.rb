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
  
  get 'plan', :to => 'plans#index', as: 'plans'
  get 'plan/:id', :to => 'plans#show', as: 'plan'

  get 'inquiries/index'
  get 'inquiries/confirm'
  get 'inquiries/thanks'
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/users/:id/unsubscribe', :to => 'users#unsubscribe', as: 'unsubscribe'
  delete '/users/:id/withdrawal', :to => 'users#withdrawal', as: 'withdrawal'

  get "users/index", to: "users#index"

  root :to => "home#index"
  
  get "sample", to: "sample#index"
  resource :profile, only: [:show, :edit, :update]

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get 'search'
    end
  end

  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
