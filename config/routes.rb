Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/users/signup", to: "users#signup", as: "new_registration_user"
  post "/users/signup", to:"users#create"
  resources :users
  root "home#index"
end
