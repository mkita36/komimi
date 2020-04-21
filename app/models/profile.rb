class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, :self_introduction, :birthday, :live_in, presence: true
end