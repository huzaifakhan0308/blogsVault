class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :photo

  validates :name, presence: true
  validates :postscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id', dependent: :destroy
  has_many :likes, foreign_key: 'author_id', dependent: :destroy

  def three_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
