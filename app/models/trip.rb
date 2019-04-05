class Trip < ApplicationRecord
  has_many :photos, inverse_of: :trip
  accepts_nested_attributes_for :photos
end
