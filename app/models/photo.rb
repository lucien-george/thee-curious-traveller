class Photo < ApplicationRecord
  belongs_to :trip
  mount_uploader :url, PhotoUploader
end
