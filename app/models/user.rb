class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :paintings, dependent: :destroy
  has_many :bookings
  has_many :incoming_bookings, through: :paintings, source: :bookings
  #need a new association for the booking of the users paintings (custom)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
