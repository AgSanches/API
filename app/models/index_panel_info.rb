class IndexPanelInfo < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :text, presence: true
  validates :type_panel, presence: true
end
