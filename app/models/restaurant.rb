class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy

  geocoded_by :location
  after_validation :geocode
  
  validates :name, presence: true

end
