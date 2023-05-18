require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'If response status was correct.' do
    it 'If response status was correct for users' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'If response status was correct.' do
    it 'If response status was correct for users ID' do
      get user_path(3)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Render correct template' do
    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get user_path(4)
      expect(response).to render_template('show')
    end
  end
end
