Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/users/signup", to: "users#signup", as: "new_registration_user"
  post "/users/signup", to:"users#create"
  get "/users/login_form", to:"users#login_form", as: "login_user"
  post "login", to:"users#login"
  resources :users do
    resources :lives
  end
  root "home#index"
end
