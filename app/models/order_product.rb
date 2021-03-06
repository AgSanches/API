class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order
  validates :product_id, presence: true
  validates :order_id, presence: true
  validates :totalPrice, presence: true
  validates :unitPrice, presence: true
  validates :quantity, presence: true
end
