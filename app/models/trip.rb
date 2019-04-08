class Trip < ApplicationRecord
  has_many :photos, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :destination, presence: true
  validates :price, presence: true
end
