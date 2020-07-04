require 'test_helper'

class Admins::OrderedItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admins_ordered_items_update_url
    assert_response :success
  end

end
