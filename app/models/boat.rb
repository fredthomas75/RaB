class Boat < ApplicationRecord
  belongs_to :user
  has_one :brand_model
  has_many :bookings, dependent: :destroy
end
