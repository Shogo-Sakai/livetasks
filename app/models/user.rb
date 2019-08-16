class User < ApplicationRecord
  # パスワードの暗号化
  has_secure_password

  # バリデーション
  validates :nickname, {presence:true}
  validates :email,    {presence:true}
  validates :email,    {uniqueness: true}
  validates :password, {presence:true}
  
  # enumの設定
  enum gender:{ Male: 0, Female: 1 }

  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader

  # アソシエーション
  has_many :staffs
  has_many :lives, through: :staffs
end
