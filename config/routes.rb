Rails.application.routes.draw do
  get 'static_pages/home'
  get "sample", to: "sample#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
