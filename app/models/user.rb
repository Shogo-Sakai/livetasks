class User < ApplicationRecord
  # パスワードの暗号化
  has_secure_password

  # バリデーション
  validates :profile,  length: {maximum: 140}
  
  # enumの設定
  enum gender:{ Male: 0, Female: 1 }

  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader

  # アソシエーション
  has_many :lives
  has_many :staffs , dependent: :delete_all
  has_many :staff_lives, through: :staffs , source: :live, dependent: :delete_all
  has_many :tasks, dependent: :delete_all
end
