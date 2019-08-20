class Boat < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :brand_model
  has_many :bookings, dependent: :destroy
end
