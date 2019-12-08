class Brand < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image
  has_many :products
end
