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
      get user_path(1)
      expect(response).to have_http_status(200)
    end
  end

  describe 'Render correct template' do
    it 'renders the index template' do
      get users_path
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      get user_path(1)
      expect(response).to render_template('show')
    end
  end

  describe 'Response body includes correct placeholder text' do
    it 'displays the correct placeholder text' do
      get users_path
      expect(response.body).to include('Here is a list of users')
    end
  end

  describe 'Response body includes correct placeholder text' do
    it 'displays the correct placeholder text' do
      get user_path(1)
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end
