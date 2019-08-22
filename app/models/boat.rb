class Boat < ApplicationRecord
    # include PgSearch::Model
  # pg_search_scope :search_by_name_and_description,
  #   against: [ :name, :description ],
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }

  mount_uploader :photo, PhotoUploader
  belongs_to :user
  belongs_to :brand_model
  has_many :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
