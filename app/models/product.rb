class Product < ApplicationRecord
  belongs_to :brand
  has_many :sizes
  has_one_attached :product_presentation
  has_one_attached :slider_photo
  has_many_attached :product_photos
  validates :name, presence: true
  validates :price, presence: true
  validates :discount, presence: true
  validates :isSale, presence: true
  validates :description, presence: true
  validates :brand_id, presence: true
end
