class User < ActiveRecord::Base
  has_many :reviews
  has_attached_file :avatar, styles: { medium: "300x300>", small: "200x200>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :first_name, presence: true
  validates :last_name, presence: true
end
