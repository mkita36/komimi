class Profile < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :image, :self_introduction, :birthday, :live_in, presence: true
end