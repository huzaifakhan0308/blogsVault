require 'rails_helper'

RSpec.describe 'User show page:', type: :feature do
  before(:each) do
    @user = User.create(name: 'unique', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                        postscounter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end
  it 'I can see the user profile picture' do
    visit user_path(@user.id)
    expect(@user.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  it 'I can see the users username.' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.name)
  end
  it 'I can see the number of posts the user has written.' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.posts.count)
  end
  it 'I can see the users bio' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.bio)
  end
  it 'I can see the users first 3 posts' do
    visit user_path(@user.id)
    expect(page).to have_content(@user.three_recent_posts.first.title)
  end
  it 'I can see a button that lets me view all of a users posts' do
    visit user_path(@user.id)
    expect(page).to have_button('See all posts')
  end
  it 'When I click a users post, it redirects me to that posts show page' do
    visit user_path(@user.id)
    click_link(@user.three_recent_posts.first.title)
    expect(page).to have_current_path(user_post_path(@user.id, @user.three_recent_posts.first.id))
  end
  it 'When I click the see all posts button, it redirects me to the users posts index page' do
    visit user_path(@user.id)
    click_link('See all posts')
    expect(page).to have_current_path(user_posts_path(@user.id))
  end
end
