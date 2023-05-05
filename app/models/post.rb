class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :update_posts_counter

  def self.five_recent_posts
    Comment.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.update(postscounter: author.posts.count)
  end
end
