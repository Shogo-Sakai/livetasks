class Staff < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :live, dependent: :destroy
end
