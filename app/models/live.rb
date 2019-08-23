class Live < ApplicationRecord

  # バリデーション
  validates :name, presence: true
  # validates :budget, numericality: { only_integer: true}
  # validates :budget, absence: true

  # モデルにimageuploaderを紐付け
  mount_uploader :image, ImageUploader

  # アソシエーション
  has_many :staffs , dependent: :delete_all
  has_many :users , through: :staffs, dependent: :destroy
  has_many :tasks , dependent: :delete_all
end
