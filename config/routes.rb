Rails.application.routes.draw do
  get 'explanations/customer'
  get 'explanations/consultant'
  get 'bottles/result'
  get 'bottles/new', to: 'bottles#new'
  get "bottles/create_select_bottle"
  post "bottles/create_select_bottle"

  resources :plans do
    resources :contracts
    resources :reviews
  end

  get 'search' => 'plans#search'
  get 'search' => 'applications#search'

  post "/plans/create"
  get "/plans/create"
  resources :messages
  resources :rooms

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  devise_scope :user do
    get "user/:id", to: "users/registrations#detail"
    get '/users', to: redirect("/users/sign_up")
    get "signup", to: "users/registrations#new"
    post "signup", to: "users/registrations#create"
    delete "logout", to: "users/sessions#destroy"
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  get 'inquiries/index'
  get 'inquiries/confirm'
  get 'inquiries/thanks'
  post 'inquiries/confirm'
  post 'inquiries/thanks'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/users/:id/unsubscribe', to: 'users#unsubscribe', as: 'unsubscribe'
  delete '/users/:id/withdrawal', to: 'users#withdrawal', as: 'withdrawal'

  get "users/index", to: "users#index"

  root to: "home#index"

  get "sample", to: "sample#index"

  resource :profile, only: [:show, :edit, :update]

  resources :users do
    resources :plans, module: 'users'
    resources :profiles
  end

  resources :users do
    member do
      get :following, :followers
    end
    resources :relationships, only: [:create, :destroy]
  end

  post "/articles/create"
  resources :articles

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
