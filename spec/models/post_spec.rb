require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
      @post = Post.create(author_id: @user.id, title: 'My Post', text: 'This is my post')
    end

    it "author_id can't be blank" do
      @post.author_id = nil
      expect(@post).to_not be_valid
    end

    it "title can't be blank" do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it "title can't exceed 250 characters" do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it "text can't be blank" do
      @post.text = nil
      expect(@post).to_not be_valid
    end

    it "comments_counter can't be blank" do
      @post.commentscounter = nil
      expect(@post).to_not be_valid
    end

    it 'comments_counter must be an integer' do
      @post.commentscounter = 'a'
      expect(@post).to_not be_valid
    end

    it 'comments_counter must be greater than or equal to 0' do
      @post.commentscounter = -1
      expect(@post).to_not be_valid
    end

    it "likes_counter can't be blank" do
      @post.likescounter = nil
      expect(@post).to_not be_valid
    end

    it 'likes_counter must be an integer' do
      @post.likescounter = 'a'
      expect(@post).to_not be_valid
    end

    it 'likes_counter must be greater than or equal to 0' do
      @post.likescounter = -1
      expect(@post).to_not be_valid
    end
  end
end
