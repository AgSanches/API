class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :type_user, presence: true
  has_many :opinions
end
