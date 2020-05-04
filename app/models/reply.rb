class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  validates :comment, length: {maximum: 140 }
end