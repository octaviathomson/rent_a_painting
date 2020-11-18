class Booking < ApplicationRecord
  validates :status, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  belongs_to :painting
  belongs_to :user
  has_one :painting_owner, through: :paintings, source: :users
end
