require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'creation' do
    before :all do
      @user = User.create(name: 'John Doe', photo: 'https://picsum.photos/200/300', bio: 'I am John Doe')
    end

    it "name can't be blank" do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it "photo can't be blank" do
      @user.photo = nil
      expect(@user).to_not be_valid
    end

    it "bio can't be blank" do
      @user.bio = nil
      expect(@user).to_not be_valid
    end

    it "posts_counter can't be blank" do
      @user.postscounter = nil
      expect(@user).to_not be_valid
    end

    it 'posts_counter must be an integer' do
      @user.postscounter = 'a'
      expect(@user).to_not be_valid
    end

    it 'posts_counter must be greater than or equal to 0' do
      @user.postscounter = -1
      expect(@user).to_not be_valid
    end
  end
end
