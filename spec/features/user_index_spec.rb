require 'rails_helper'

RSpec.describe 'User index page:', type: :feature do
  before(:each) do
    @user = User.create(name: 'unique', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test',
                        postscounter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post')
  end

  it 'I can see the username of all other users' do
    visit users_path
    expect(page).to have_content(@user.name)
  end
  it 'I can see the profile picture for each user.s' do
    visit users_path
    expect(@user.photo).to match(%r{^http?://.*\.(jpe?g|gif|png)$})
  end
  it 'I can see the number of posts each user has written.' do
    visit users_path
    expect(page).to have_content(@user.posts.count)
  end
  it 'When I click on a user, I am redirected to that user show page' do
    visit users_path
    click_link(@user.name)
    expect(page).to have_current_path(user_path(@user.id))
  end
end
