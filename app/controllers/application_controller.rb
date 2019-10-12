class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # ログイン済みユーザーのみにアクセスを許可する
  # before_action :authenticate_user!

  # deviseコントローラーにストロングパラメータを追加する
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected
  # def configure_permitted_parameters
    # アカウント登録時
    # devise_parameter_sanitizer.permit(:sign_up, keys: [ :nickname, :birthyear, :birthmonth, :birthday, :age, :gender, :profile])
    # アカウント編集時
#     devise_parameter_sanitizer.permit(:account_update, keys: [ :nickname, :birthyear, :birthmonth, :birthday, :age, :gender, :profile])
#   end
end
