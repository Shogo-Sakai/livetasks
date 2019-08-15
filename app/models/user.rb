class User < ApplicationRecord
  has_secure_password
  validates :nickname, {presence:true}
  validates :email,    {presence:true}
  validates :email,    {uniqueness: true}
  validates :password, {presence:true}
  
  has_many :staffs
  has_many :lives, through: :staffs
end
