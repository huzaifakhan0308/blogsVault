class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likescounter: post.likes.count)
  end
end
