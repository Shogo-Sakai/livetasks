class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :omniauthable, omniauth_providers: [:twitter, :facebook]

  # パスワードの暗号化
  # has_secure_password

  
  # enumの設定
  enum gender:{ Male: 0, Female: 1 }
  
  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader
  
  # アソシエーション
  has_many :lives
  has_many :staffs , dependent: :delete_all
  has_many :staff_lives, through: :staffs , source: :live, dependent: :delete_all
  has_many :tasks, dependent: :delete_all
  # バリデーション
  validates :profile,  length: {maximum: 140}

end
