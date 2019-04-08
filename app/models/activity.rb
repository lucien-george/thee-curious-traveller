class Activity < ApplicationRecord
  has_many :activity_breakdowns, dependent: :destroy
end
