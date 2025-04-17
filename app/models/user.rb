class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :active_relationship, class_name: :user, foreign_key: :followed
  has_many :active_relationship, class_name: :user, foreign_key: :follower

  def follow(user_id)
    user = User.find(user_id)
    current_user.active_relationship.create(user)
  end
end
