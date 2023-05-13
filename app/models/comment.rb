class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post'
  after_save :update_comments_counter

  private

  def update_comments_counter
    post.update(commentscounter: post.comments.count)
  end
end
