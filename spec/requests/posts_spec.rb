require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'If response status was correct.' do
    it 'If response status was correct for user posts path' do
      get user_posts_path(3)
      expect(response).to have_http_status(200)
    end
  end

  describe 'If response status was correct.' do
    it 'If response status was correct for user post path and user ID' do
      get user_post_path(3, 2)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Render correct template' do
    it 'renders the posts template' do
      get user_posts_path(3)
      expect(response).to render_template('posts/index')
    end
  end

  describe 'Render correct template' do
    it 'renders the show template' do
      get user_post_path(3, 2)
      expect(response).to render_template('posts/show')
    end
  end
end
