class Live < ApplicationRecord
  has_many :staffs
  has_many :users, through: :staffs

end
