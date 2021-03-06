Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    delete 'destroy' => 'devise/sessions#destroy',as: :current_user_destroy
  end

  get 'calendar/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ユーザーログイン関係
  get "/signup", to: "users#signup", as: "new_registration_user"
  post "/signup", to:"users#create"
  get "login", to:"users#login_form", as: "login_user"
  post "login", to:"users#login"
  post "logout", to:"users#logout"

  # インクリメンタルサーチ用
  get "/users/search", to: "users#search"

  # ネスト
  resources :users do
    resources :lives 
  end

  # タスク
  post "toggle_finish/:id", to: "tasks#toggle"
  resources :tasks

  # カレンダー

  # ルート
  root "home#index"
end
