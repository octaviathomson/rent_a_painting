class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :painting, dependent: :destroy
  has_many :booking
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
