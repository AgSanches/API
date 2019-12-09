class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  validates :name
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :surnames
  validates :street
  validates :postalcode
  validates :country
  validates :city
  validates :passport
  validates :phone
  validates :type, presence: true
end
