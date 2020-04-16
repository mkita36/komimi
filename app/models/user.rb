class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
        #  :recoverable,
        #  :rememberable,
         :validatable
  validates :name, presence: true
  has_many :tweets, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one :profile, dependent: :destroy
end