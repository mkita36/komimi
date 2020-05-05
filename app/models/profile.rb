class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :self_introduction, :live_in, :birthday, presence: true
end