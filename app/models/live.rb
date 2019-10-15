class Live < ApplicationRecord

  # バリデーション
  validates :name, presence: true

  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader

  # アソシエーション
  has_many :staffs , dependent: :delete_all
  has_many :users , through: :staffs, dependent: :destroy
  has_many :tasks , dependent: :delete_all
end
