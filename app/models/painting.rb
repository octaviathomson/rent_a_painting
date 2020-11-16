class Painting < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :booking, dependent: :destroy
end
