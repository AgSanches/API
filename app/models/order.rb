class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  validates :phone, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :methodpayment, presence: true
  validates :passport, presence: true
  validates :street, presence: true
  validates :methodship, presence: true
end
