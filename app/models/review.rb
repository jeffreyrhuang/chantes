class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :user_id, presence: true
  validates :restaurant_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  validates :rating,  presence: true, inclusion: (1..5)

end
