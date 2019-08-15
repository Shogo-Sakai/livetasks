class Live < ApplicationRecord
  has_many :users, through: :staffs
end
