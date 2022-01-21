Rails.application.routes.draw do
  get 'users/new'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'   
  } 

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "users/sign_in", :to => "users/sessions#new"
    get "users/sign_out", :to => "users/sessions#destroy"
  end
  
  get "sample", to: "sample#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
