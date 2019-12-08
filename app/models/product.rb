class Product < ApplicationRecord
  belongs_to :brand
  has_one_attached :product_presentation, presence: true
  has_one_attached :slider_photo, presence: true
  has_many_attached :product_photos, presence: true
end
