require 'rails_helper'

RSpec.describe 'User post index page:', type: :feature do
  before(:each) do
    @user_one = User.create(name: 'unique', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                            postscounter: 0)
    @post_one = Post.create(author: @user_one, title: 'Hello', text: 'This is my first post')
    @comment_one = Comment.create(post: @post_one, author: @user_one, text: 'Hi Tom!')
    @like_one = Like.create(author: @user_one, post: @post_one)
  end
  it 'I can see the users profile picture.' do
    visit user_posts_path(@user_one.id)
    expect(@user_one.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  it 'I can see the users name.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@user_one.name)
  end
  it 'I can see the number of posts the user has written.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@user_one.posts.count)
  end
  it 'I can see a posts title.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.title)
  end
  it 'I can see some of the posts body.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.title)
  end
  it 'I can see the first comments on a post.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.five_recent_comments.first.text)
  end
  it 'I can see how many comments a post has.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.comments.count)
  end
  it 'I can see how many likes a post has.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_content(@post_one.likes.count)
  end
  it 'I can see a section for pagination if there are more posts than fit on the view.' do
    visit user_posts_path(@user_one.id)
    expect(page).to have_button('Pagination')
  end
  it 'When I click on a post, it redirects me to that posts show page.' do
    visit user_posts_path(@user_one.id)
    click_link(@user_one.posts.first.title)
    expect(page).to have_current_path(user_post_path(@user_one.id, @user_one.posts.first.id))
  end
end
