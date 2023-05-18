require 'rails_helper'
RSpec.describe 'Post show page:', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'unique', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                            postscounter: 0)
    @post_one = Post.create(author: @user_one, title: 'Hello', text: 'This is my first post')
    @comment_one = Comment.create(post: @post_one, author: @user_one, text: 'Hi Tom!')
    @like_one = Like.create(author: @user_one, post: @post_one)
  end
  it 'I can see the posts title.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.title)
  end
  it 'I can see who wrote the post' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.author.name)
  end
  it 'I can see how many comments it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.comments.count)
  end
  it 'I can see how many likes it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.likes.count)
  end
  it ' I can see the post body.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.text)
  end
  it 'I can see the username of each commentor.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@comment_one.author.name)
  end
  it 'I can see the body of each comment.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@user_one.posts.first.comments.first.text)
  end
end
