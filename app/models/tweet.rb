class Tweet < ApplicationRecord
  belongs_to :user
  has_many :replies, dependent: :destroy
  validates :content, length: {maximum: 140 }
end
