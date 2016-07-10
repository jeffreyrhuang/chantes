class Restaurant < ActiveRecord::Base
  acts_as_votable

  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode
  
  validates :name, presence: true

end
