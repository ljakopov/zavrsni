require 'test_helper'

class UsergroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get usergroups_index_url
    assert_response :success
  end

  test "should get new" do
    get usergroups_new_url
    assert_response :success
  end

end
