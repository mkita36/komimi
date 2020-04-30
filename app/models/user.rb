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
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    followed = follower.find_by(followed_id: user_id)
    followed.destroy if followed
  end

  def following?(user)
    following_user.include?(user)
  end
end