class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :phone, length: {maximum: 9}
  has_many :opinions
end
