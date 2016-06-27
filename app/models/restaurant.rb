class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  # reverse_geocoded_by :latitude, :longitude
  # after_validation :reverse_geocode
  
  validates :name, presence: true

end
