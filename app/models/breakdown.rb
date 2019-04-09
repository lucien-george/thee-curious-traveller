class Breakdown < ApplicationRecord
  belongs_to :activity
  validates :description, presence: true
end
