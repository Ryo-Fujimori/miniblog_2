class Post < ApplicationRecord
  belongs_to :user

  # dbのlimit制約が効いてなかった
  # モデルでバリデーションするように
  validates :content, presence: true, length: { maximum: 140 }
end
