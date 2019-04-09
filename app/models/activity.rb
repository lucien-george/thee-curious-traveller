class Activity < ApplicationRecord
  has_many :breakdowns, dependent: :destroy
  belongs_to :trip
end
