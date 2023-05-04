require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get blogs' do
    get pages_blogs_url
    assert_response :success
  end
end
