class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
        #  :recoverable,
        #  :rememberable,
         :validatable
  validates :name, presence: true
  has_many :tweets
  has_many :replies
  has_one :profile
end