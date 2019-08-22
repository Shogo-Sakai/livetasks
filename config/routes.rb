Rails.application.routes.draw do
  get 'calendar/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # ユーザーログイン関係
  get "/users/signup", to: "users#signup", as: "new_registration_user"
  post "/users/signup", to:"users#create"
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
  get "task_calendar/:id",  to: "tasks#calendar", defaults: {format: 'json'}
  resources :tasks

  # カレンダー
  resources :calendars, only: [:index, :show]

  # ルート
  root "home#index"
end
