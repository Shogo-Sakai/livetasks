class Task < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :live, dependent: :destroy

  # バリデーション
  validates :content, presence: true
end
