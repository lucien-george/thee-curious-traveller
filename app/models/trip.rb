class Trip < ApplicationRecord
  has_many :photos, dependent: :destroy
  has_many :date_ranges, dependent: :destroy
  has_many :trip_activities, dependent: :destroy
  has_many :activities, through: :trip_activities
  validates :title, presence: true
  validates :description, presence: true
  validates :destination, presence: true
  validates :price, presence: true
  monetize :price_cents
end
