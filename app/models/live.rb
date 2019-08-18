class Live < ApplicationRecord

  # バリデーション
  validates :name, presence: true
  validates :budget, numericality: { only_integer: true}

  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader

  # アソシエーション
  has_many :staffs
  has_many :users, through: :staffs

end
