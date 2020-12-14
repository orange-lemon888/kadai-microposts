class Micropost < ApplicationRecord
  belongs_to :user
  
  has_many :favorites,dependent: :destroy     #お気に入りをしているユーザへの参照
  has_many :users, through: :favorites        #お気に入りをしているユーザ(複数）favoritesのuser_id参照
  validates :content, presence: true, length: { maximum: 255 }
end
