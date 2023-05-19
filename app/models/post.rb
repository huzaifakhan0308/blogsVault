class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :commentscounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likescounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_counter

  after_destroy :decrement_user_post_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def decrement_user_post_counter
    author.decrement!(:postscounter)
  end

  def update_posts_counter
    author.update(postscounter: author.posts.count)
  end
end
