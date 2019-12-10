class Opinion < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :title, presence: true
  validates :user_id, presence: true
  validates :body, presence: true, length: {minimum: 25}
  validates :product_id, presence: true
end
