class Painting < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, inclusion: { in: (1..10_000_00) }
  validates :description, presence: true
  #has_one_attached :photo
  belongs_to :user
  has_many :bookings, dependent: :destroy
end
