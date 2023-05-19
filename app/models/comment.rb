class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'

  after_save :update_comments_counter

  after_destroy :decrement_post_comment_counter

  private

  def update_comments_counter
    post.update(commentscounter: post.comments.count)
  end

  def decrement_post_comment_counter
    post.decrement!(:commentscounter)
  end
end
