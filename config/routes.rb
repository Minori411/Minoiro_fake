Rails.application.routes.draw do
  get 'users/index', :to => "users#index"
  get 'users/new', :to => "users#new"
  
  get "sample", to: "sample#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
