require 'test_helper'

class Admins::SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_searches_index_url
    assert_response :success
  end

end
