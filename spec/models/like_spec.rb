require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id: @user.id, title: 'My Post', text: 'This is my post')
      @like = Like.create(author_id: @user.id, post_id: @post.id)
    end

    it "user_id can't be blank" do
      @like.author_id = nil
      expect(@like).to_not be_valid
    end

    it 'user_id must be an integer' do
      @like.author_id = 'a'
      expect(@like).to_not be_valid
    end

    it 'user_id must be greater than 0' do
      @like.author_id = 0
      expect(@like).to_not be_valid
    end

    it "post_id can't be blank" do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end

    it 'post_id must be an integer' do
      @like.post_id = 'a'
      expect(@like).to_not be_valid
    end

    it 'post_id must be greater than 0' do
      @like.post_id = -1
      expect(@like).to_not be_valid
    end
  end
end
