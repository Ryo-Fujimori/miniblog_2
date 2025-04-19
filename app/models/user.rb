class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy

  def follow(user_id)
    user = User.find(user_id)
    current_user.active_relationship.create(user)
  end

  def unfollow
    Relationship.find(params[:id]).destroy!
  end
end
