class User < ApplicationRecord
  has_secure_password
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  validates :email, presence: true, uniqueness: true
  has_many :friendships
  has_many :friends, through: :friendships
  # has_many :backward_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  # has_many :backward_friends, through: :backward_friendships, source: :user

  def to_s
    name
  end
end
