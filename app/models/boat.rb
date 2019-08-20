class Boat < ApplicationRecord
  belongs_to :user
  belongs_to :brand_model
  has_many :bookings, dependent: :destroy
end
